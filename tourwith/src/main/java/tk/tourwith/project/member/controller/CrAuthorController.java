package tk.tourwith.project.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import tk.tourwith.project.crew.model.Crew;
import tk.tourwith.project.crew.service.impl.CrewServiceImpl;
import tk.tourwith.project.member.model.CrAuthor;
import tk.tourwith.project.member.model.Member;
import tk.tourwith.project.member.service.impl.CrAuthorServiceImpl;
import tk.tourwith.project.member.service.impl.MemberServiceImpl;

@Controller
public class CrAuthorController {
	
	@Autowired
	CrAuthorServiceImpl crAuthorService;
	@Autowired
	CrewServiceImpl crewService;
	@Autowired
	MemberServiceImpl memberService;
	
	@ResponseBody
	@RequestMapping("/crew/register/{cr_no}")
	public Map<String, Object> requestRegister(HttpSession session, @PathVariable("cr_no") String cr_no) throws Exception{
		
		Map<String, Object> model = new HashMap<>();
		
		Member member = (Member) session.getAttribute("LOGIN_USER");
		
		CrAuthor crAuthor = new CrAuthor();
		
		crAuthor.setCr_no(cr_no);
		crAuthor.setMb_no(member.getMb_no());
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("cr_no", cr_no);
		paramMap.put("mb_no", member.getMb_no());

		//member(mb_no)'s authority is checked by selecting author list by cr_no  
		CrAuthor crAuthorCheck = crAuthorService.selectAuthorByMbNoCrNo(paramMap);
		
		//get this crew by cr_no
		Crew crew = crewService.getCrew(cr_no);
		
		//모집이 종료 되었을 때
		if(StringUtils.equals(crew.getRcrit_sttus(),"RECR_STAT_02")){
			model.put("message", "모집이 종료된 크루입니다.");
			return model;
		}
		
		paramMap.put("depr_de", crew.getDepr_de());
		paramMap.put("arvl_de", crew.getArvl_de());
		
		//해당 크루의 여행 기간에 겹치는 가입 크루가 있을 때...(group_code = CR_ROLE_REG)
		List<CrAuthor> checkDeList = crAuthorService.selectListByDe(paramMap);
		if(checkDeList.size() > 0) {
			model.put("message", "이미 해당 기간에 가입한 크루가 있습니다.");
			return model;
		}
		
		
		int updCnt = 0;
		
		//doesnt registered
		if(crAuthorCheck == null) {
			updCnt = crAuthorService.insertCrewRequestIntoCrAuthor(crAuthor);
			
		}else {
			String authCode = crAuthorCheck.getAuthor_code();
			if(StringUtils.equals(authCode, "CR_ROLE_01")) {
				//크루 리더일 때
				model.put("message", "크루 리더는 참가신청을 할 수 없습니다.");
			}else if(StringUtils.equals(authCode, "CR_ROLE_02")) {
				//일반 회원일 때
				model.put("message", "크루원은 참가신청을 할 수 없습니다.");
				
			}else if(StringUtils.equals(authCode, "CR_ROLE_03") || StringUtils.equals(authCode, "CR_ROLE_05")) {
				//이미 신청한 회원일 때
				model.put("message", "이미 참가 신청한 크루입니다.");
			
			}else if(StringUtils.equals(authCode, "CR_ROLE_04") || StringUtils.equals(authCode, "CR_ROLE_06")) {
				//가입거절, 강퇴 1회 당한 회원일 때
				updCnt = crAuthorService.updateRequest(paramMap);
				model.put("message", "가입 거절 당했던 크루입니다. 재 신청 하였습니다.");
				return model;
				
			}else if(StringUtils.equals(authCode, "CR_ROLE_07")) {
				//2번 강퇴 당한 회원일 때
				model.put("message", "2번 강퇴당하셨으므로 크루 참가 재신청이 불가능 합니다.");
				return model;
			}
			
		}
		
		if(updCnt > 0) {
			
			model.put("message", "크루 리더에게 가입 신청 메세지를 전송하였습니다.");
		}
		
		return model;
		
	}
	
	@RequestMapping("/crew/approve/{mb_no}/{cr_no}")
	public String updateApprove(HttpSession session, Model model, @PathVariable("mb_no") String mb_no,
			@PathVariable("cr_no") String cr_no) throws Exception {
		
		Member member = (Member) session.getAttribute("LOGIN_USER");
		
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("mb_no", member.getMb_no());
		paramMap.put("cr_no", cr_no);
		
		CrAuthor leader = crAuthorService.selectAuthorByMbNoCrNo(paramMap);
		
		//현재 로그인 유저가 크루리더인지 확인
		if(StringUtils.equals(leader.getAuthor_code(), "CR_ROLE_01")) {
			
			paramMap.remove("mb_no");
			paramMap.put("mb_no", mb_no);
			member = memberService.selectMemberByPK(mb_no);
			crAuthorService.updateRequestApproved(paramMap);
			Crew crew = crewService.getCrew(cr_no);
			
			if(StringUtils.equals("여성", member.getGender())) {
				if(crew.getNow_female_nmpr() < crew.getFemale_nmpr()) {

					crew.setNow_female_nmpr(crew.getNow_female_nmpr() + 1);
					
				}else {
					throw new Exception();
				}
			
			}else{
				if(crew.getNow_male_nmpr() < crew.getMale_nmpr()) {
					
					crew.setNow_male_nmpr(crew.getNow_male_nmpr() + 1);				
					
				}else {
					throw new Exception();
				}
			
			}
			
			crewService.updateCrew(crew);
			crewService.updateRcritSttusByNmpr();
		}else {
			throw new Exception();
		}
		
		model.addAttribute("locationURL", "/member/mypage");
		
		return "common/redirect";
	}
	
	@RequestMapping("/crew/cancel/{cr_no}")
	public String cancelRequest(HttpSession session, Model model, @PathVariable("cr_no") String cr_no) throws Exception {
		
		Member member = (Member) session.getAttribute("LOGIN_USER");
		
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("mb_no", member.getMb_no());
		paramMap.put("cr_no", cr_no);
		
		CrAuthor crAuthor = crAuthorService.selectAuthorByMbNoCrNo(paramMap);
		
		if(crAuthor != null) {
			crAuthorService.updateRequestRefuse(paramMap);
			
		}else {
			throw new Exception();
		}
		
		model.addAttribute("locationURL", "/member/mypage");
		
		return "common/redirect";
	}
	
	@RequestMapping("/crew/kick/{mb_no}/{cr_no}")
	public String kickoutRequest(HttpSession session, Model model,
			@PathVariable("mb_no") String mb_no, @PathVariable("mb_no") String cr_no ) throws Exception {
		
		//check Leader
		Member member = (Member) session.getAttribute("LOGIN_USER");
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("mb_no", member.getMb_no());
		paramMap.put("cr_no", cr_no);
		
		CrAuthor loginUserAthor = crAuthorService.selectAuthorByMbNoCrNo(paramMap);
		
		if(loginUserAthor != null) {
			
			// login user = leader
			if(StringUtils.equals(loginUserAthor.getAuthor_code(), "CR_ROLE_01")) {
				
				paramMap.remove("mb_no");
				paramMap.put("mb_no", mb_no);
				
				int updCnt = crAuthorService.updateKickOut1(paramMap);
				
				
				if(updCnt <= 0) {
					throw new Exception();
				}else {
					
					//신청한 멤버
					member = memberService.selectMemberByPK(mb_no);
					
					if(StringUtils.equals(member.getGender(), "여성")) {
						
						Crew crew = crewService.getCrew(cr_no);
						crew.setNow_female_nmpr(crew.getNow_female_nmpr() - 1);
						
					}else {
						
						Crew crew = crewService.getCrew(cr_no);
						crew.setNow_male_nmpr(crew.getNow_male_nmpr() - 1);
						
						
					}

				}
				
			}else {
				throw new Exception();
				
			}
			
		}
		
		
		//goto crew room
		model.addAttribute("locationURL", "/crew/room/"+cr_no);
		return "common/redirect";
	}
	
	@RequestMapping("/crew/refuse/{mb_no}/{cr_no}")
	public String refuseRequest(@PathVariable("mb_no") String mb_no,
			@PathVariable("cr_no") String cr_no, HttpSession session, Model model) {
		
		//login 유저
		Member member  = (Member)  session.getAttribute("LOGIN_USER");
		
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("mb_no", member.getMb_no());
		paramMap.put("cr_no", cr_no);
		
		CrAuthor loginUserAthor = crAuthorService.selectAuthorByMbNoCrNo(paramMap);
		
		if(loginUserAthor != null) {
			
			// login user = leader
			if(StringUtils.equals(loginUserAthor.getAuthor_code(), "CR_ROLE_01")) {
				
				paramMap.remove("mb_no");
				paramMap.put("mb_no", mb_no);
				
				crAuthorService.updateRequestRefuse(paramMap);
			
			}
		}
		
		model.addAttribute("locationURL", "/member/mypage");
		
		return "common/redirect";
	
	}
	
	
}
