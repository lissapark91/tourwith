package tk.tourwith.project.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.velocity.exception.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tk.tourwith.project.member.model.CrAuthor;
import tk.tourwith.project.member.model.Member;
import tk.tourwith.project.member.service.MemberService;
import tk.tourwith.project.member.service.impl.CrAuthorServiceImpl;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	CrAuthorServiceImpl crAuthorService;
	
	@RequestMapping("/form/{fb_id}")
	public String memberForm(@PathVariable("fb_id") String fb_id , Model model, Member member) throws Exception {
		
		//이미 가입되어 있는 아이디이면
		if(memberService.selectMemberById(fb_id) != null || StringUtils.isEmpty(member.getFb_tkn()) || StringUtils.isBlank(member.getFb_tkn())) {
			throw new ResourceNotFoundException("잘못된 접근 입니다."); //500에러
		}
		
		//form으로 넘겨 닉네임을 입력 받게 한다.
		member.setFb_id(fb_id);
		model.addAttribute(member);
		
		
		return "member/memberForm";
	}
	
	//nick 중복을 체크한다.
	@ResponseBody
	@RequestMapping(value="/nick", method=RequestMethod.POST)
	public Map<String, Object> nickCheck(@RequestParam(value="nick") String nick, Model model, Member member) throws Exception {
		
		boolean able = true;
		String message = "사용 가능한 닉네임 입니다.";
		
		if(nick.length() < 2) {
			message = "닉네임은 2글자 이상으로 설정해 주세요.";
			
			Map<String, Object> result = new HashMap<>();
			
			able= false;
			result.put("message", message);
			result.put("able", able);
			
			return result;
		}
		if(nick.length() >= 50) {
			message = "닉네임은 50글자 미만으로 설정해 주세요.";
			
			Map<String, Object> result = new HashMap<>();
			
			able = false;
			result.put("message", message);
			result.put("able", able);
			
			return result;
		}
		if(StringUtils.contains(nick, ' ')) {
			message = "닉네임에 공백을 사용할 수 없습니다.";
			
			Map<String, Object> result = new HashMap<>();
			
			able = false;
			result.put("message", message);
			result.put("able", able);
			
			return result;
		}
		if(StringUtils.contains(nick, "관리자") || StringUtils.contains(nick, "마스터")) {
			message = "닉네임에 사용할 수 없는 단어가 포함되어 있습니다.";
			
			Map<String, Object> result = new HashMap<>();
			
			able = false;
			result.put("message", message);
			result.put("able", able);
			
			return result;
		}
		
		
		Member memberByNick = memberService.selectMemberByNick(nick);
		
		if(memberByNick != null) {
			able = false;
			message = "이미 존재하는 닉네임 입니다.";
		}
		
		Map<String, Object> result = new HashMap<>();
		
		
		result.put("message", message);
		result.put("able", able);
		
		return result;
	}
	
	//회원 가입을 한다.
	@RequestMapping("/signup")
	public String memberInsert(HttpSession session, Model model, Member member) throws Exception {
		
		// 회원을 넣는다.
		int updCnt = memberService.insertMember(member);
		
		// 회원 가입에 성공하면 로그인 한 상태가 된다. (세션에 로그인 정보 추가)
		if(updCnt > 0) {
			
			member = memberService.selectMemberById(member.getFb_id()); //나머지 정보를 세팅해서
			session.setAttribute("LOGIN_USER", member); //세션에 로그인정보를 넣는다.
			session.setAttribute("LOGIN_STATUS", "LOGIN"); //로그인 상태 (로그인)
			
		}
		
		return "common/welcome";
	}
	
	
	
	//마이페이지
	@RequestMapping("/mypage")
	public String myPage(HttpSession session, Model model) throws Exception {
		
		//login user
		Member member = (Member) session.getAttribute("LOGIN_USER");
		
		String mb_no = member.getMb_no();
		
		// 해당 멤버가 속한 모든 크루
		List<CrAuthor> crAuthorList = crAuthorService.selectListByMbNo(mb_no);
		
		// 해당 멤버가 리더인 크루
		List<Map<String, Object>> crLeadrList = new ArrayList<>();
		for(CrAuthor auth : crAuthorList) {
			
			if(StringUtils.equals(auth.getAuthor_code(), "CR_ROLE_01")){
				
				Map<String, Object> paramMap = new HashMap<>();
				paramMap.put("cr_no", auth.getCr_no());
				paramMap.put("author_code", "CR_ROLE_03");
								
				List<Map<String, Object>> mapList = crAuthorService.selectListByMap(paramMap);
				for(Map<String, Object> map : mapList) {
					crLeadrList.add(map);
				}
				System.out.println("crleader " + crLeadrList.size());
			}
			
		}
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("mb_no", member.getMb_no());
		
		model.addAttribute("crAuthorList", crAuthorService.selectListByMap(paramMap));
		model.addAttribute("crLeadrList", crLeadrList);
		
		
		return "member/myPage";
	}
	
	
	
}
