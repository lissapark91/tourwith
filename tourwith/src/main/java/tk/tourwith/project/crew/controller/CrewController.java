package tk.tourwith.project.crew.controller;

import java.util.ArrayList;
import java.util.Arrays;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tk.tourwith.project.code.model.Code;
import tk.tourwith.project.code.service.impl.CodeServiceImpl;
import tk.tourwith.project.crew.model.Crew;
import tk.tourwith.project.crew.service.impl.CrewServiceImpl;
import tk.tourwith.project.member.model.CrAuthor;
import tk.tourwith.project.member.model.Member;
import tk.tourwith.project.member.service.impl.CrAuthorServiceImpl;
import tk.tourwith.project.member.service.impl.MemberServiceImpl;
import tk.tourwith.project.util.PagingUtil;

@Controller
public class CrewController {

	@Autowired
	CrewServiceImpl crewService;
	@Autowired
	CodeServiceImpl codeService;
	@Autowired
	MemberServiceImpl memberService;
	@Autowired
	CrAuthorServiceImpl crAuthorService;

	@RequestMapping("/crew/list/{category}")
	public String getCrewList(@PathVariable String category, 
			String big_cate_2, String nmpl, String depr_de, String cr_sj,
			String cr_leadr_mb_nick,
			@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
			Model model) throws Exception {
		
		
		List<Code> codeList = codeService.selectListByGroupCode("BIG_CATE");
		
		Map<String, Object> paramMap = new HashMap<>();
		// BIG_CATE_{} by.bsp
		category = "BIG_CATE_" + category;
		paramMap.put("category", category);
		
		//search
		paramMap.put("big_cate_2", big_cate_2);
		paramMap.put("nmpl", nmpl);
		paramMap.put("depr_de", depr_de);
		paramMap.put("cr_sj", cr_sj);
		//리더 닉네임
		paramMap.put("cr_leadr_nm_nick", cr_leadr_mb_nick);

		model.addAttribute("big_cate_2", big_cate_2);
		model.addAttribute("nmpl", nmpl);
		model.addAttribute("depr_de", depr_de);
		model.addAttribute("cr_sj", cr_sj);
		model.addAttribute("cr_leadr_mb_nick", cr_leadr_mb_nick);
		
		model.addAttribute("category", category);
		
		
		//리더 닉네임
		paramMap.put("cr_leadr_nm_nick", cr_leadr_mb_nick);
		
		// 페이징 처리 180223 종표
		int totalCount = crewService.getTotalCnt(paramMap);
		
		PagingUtil pagingUtil = new PagingUtil(currentPage, totalCount, 10, 5);
		
		// 콘솔 확인용
		System.out.println( "================================");
		System.out.println( "getCurrentPage : " + pagingUtil.getCurrentPage());
		System.out.println( "getTotalCount : " + pagingUtil.getTotalCount());	
		System.out.println( "================================");
		
		paramMap.put("startRow", pagingUtil.getStartRow());
		paramMap.put("endRow", pagingUtil.getEndRow());
		
		List<Crew> getCrewList = crewService.selectCrewList(paramMap);
		
		model.addAttribute("getCrewList", getCrewList);
		model.addAttribute("pagingUtil", pagingUtil.getPageHtml().toString());
		
		
		
		
		
		List<Crew> crewList = crewService.selectCrewList(paramMap);
		
		model.addAttribute("codeList", codeList);
		model.addAttribute("crewList", crewList);			

		return "crew/crewList";
	}

	@RequestMapping("crew/page/{cr_no}")
	public String crewView(Model model, @PathVariable(value = "cr_no", required = true) String cr_no,
			HttpSession session) throws Exception {
		Crew crew = null;

		crew = crewService.getCrew(cr_no);
		
		//로그인유저가 크루 리더이면 수정 삭제를 노출 (로그인이 되어있다는 가정하)
		Member member =  (Member) session.getAttribute("LOGIN_USER");
		if(StringUtils.equals(crew.getCr_leadr_mb_no(), member.getMb_no())) {
			model.addAttribute("isLeader", true);
			
		}
		
	//현재 로그인 유저가 크루원인지 아닌지(참가하기버튼, 크루룸으로 이동 버튼)
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("mb_no", member.getMb_no());
		paramMap.put("cr_no", cr_no);
		
		CrAuthor memberCrAuthor = crAuthorService.selectAuthorByMbNoCrNo(paramMap);
		System.out.println(memberCrAuthor.getAuthor_group_code());
		if(StringUtils.equals(memberCrAuthor.getAuthor_group_code(), "CR_ROLE_REG")) {
			model.addAttribute("isCrewMember", true);
		}else {
			model.addAttribute("isCrewMember", false);
		}
		
		
//		trplc, 크루 리더, 테마, 모집상태 이름을 넣어준다.
		
		member = memberService.selectMemberByPK(crew.getCr_leadr_mb_no());
		crew.setCr_leadr_nick(member.getNick());
		crew.setCr_leadr_fb_id(member.getFb_id());

		Code code = codeService.selectCodeByPk(crew.getTrplc_no());
		crew.setTrplc_no_nm(code.getCode_nm());
		
		code = codeService.selectCodeByPk(crew.getThema());
		crew.setThema_nm(code.getCode_nm());
		
		code = codeService.selectCodeByPk(crew.getRcrit_sttus());
		crew.setRcrit_sttus_nm(code.getCode_nm());
//		

		
		model.addAttribute("crew", crew);

		return "crew/crewView";
	}

	@RequestMapping("crew/form")
	public String crewForm(@RequestParam(value = "cr_no", required = false, defaultValue = "") String cr_no,
			@RequestParam(value="groupCode", required = false, defaultValue="01") String groupCode,
			Model model, HttpSession session) throws Exception {

		Crew crew = null;
		//수정 : 크루 리더인지 확인하고 수정
		if(StringUtils.isNotBlank(cr_no) && StringUtils.isNotEmpty(cr_no)) {
			Member member =  (Member) session.getAttribute("LOGIN_USER");
			crew = crewService.getCrew(cr_no);
			
			//크루리더와 로그인 유저가 같을때
			if(StringUtils.equals(crew.getCr_leadr_mb_no(), member.getMb_no())) {
				model.addAttribute("crew", crew);
			}
			
			//trplc_no뒤에 문자 2개를 짤라서 그룹코드로 넣는다.
			groupCode = crew.getTrplc_no();
			groupCode = groupCode.substring(0, groupCode.length()-3);
			model.addAttribute("groupCode", groupCode);
			
			//그룹 코드의 그룹코드
			groupCode = groupCode.substring(0, groupCode.length()-3);
			//나라별 선택
			List<Code> bigCateList = codeService.selectListByGroupCode(groupCode);
			
			//테마 선택
			List<Code> themaList = codeService.selectListByGroupCode("THEMA");
			
			model.addAttribute("bigCateList", bigCateList);
			model.addAttribute("themaList", themaList);
		}else {
			//Insert
			
			// when value of groupCode is in groupCodeArr
			ArrayList<String> groupCodeArr = new ArrayList<>();
			groupCodeArr.add("01"); groupCodeArr.add("02"); groupCodeArr.add("03");
			groupCodeArr.add("04"); groupCodeArr.add("05"); groupCodeArr.add("06");
			if(groupCodeArr.contains(groupCode) ) {
				groupCode = "BIG_CATE_" + groupCode;
				
				model.addAttribute("groupCode", groupCode);
				//나라별 선택
				List<Code> bigCateList = codeService.selectListByGroupCode("BIG_CATE");
				
				//테마 선택
				List<Code> themaList = codeService.selectListByGroupCode("THEMA");
				
				model.addAttribute("bigCateList", bigCateList);
				model.addAttribute("themaList", themaList);
				
			}else {
				throw new RuntimeException();
			}
			
			
			
		}
		

		return "crew/crewForm";
	}

	@RequestMapping(value = "crew/crewInsert", method = RequestMethod.POST)
	public String insertCrew(Crew crew, Model model,
			HttpSession session
			) throws Exception {
		
		Member member = (Member) session.getAttribute("LOGIN_USER");
		
		// if login user is registered a crew in this period, cannot make crew
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("mb_no", member.getMb_no());
		paramMap.put("depr_de", crew.getDepr_de());
		paramMap.put("arvl_de", crew.getArvl_de());
		
		List<CrAuthor> checkDeList = crAuthorService.selectListByDe(paramMap);
		
		if(checkDeList.size() > 0) {
			model.addAttribute("isError", true);
			model.addAttribute("message", "해당 기간에 가입한 크루가 존재합니다..");
			model.addAttribute("locationURL", "/crew/form");
			
			return "common/message";
		}
		
		///////////////////
		
		//set crew leader
		crew.setCr_leadr_mb_no(member.getMb_no());
		
		//set now female or male nmpr consider leader's gender
		if(StringUtils.equals(member.getGender(),"여성")) {
			
			crew.setNow_female_nmpr(1);
			crew.setNow_male_nmpr(0);
			
		}else if(StringUtils.equals(member.getGender(), "남성")) {
			
			crew.setNow_male_nmpr(1);
			crew.setNow_female_nmpr(0);
			
		}
		
		System.out.println("depr_de" + crew.getDepr_de());
		
		int updCnt = crewService.insertCrew(crew);
		
		
		model.addAttribute("isError", false);
		model.addAttribute("message", "정상적으로 크루를 만들었습니다.");
		model.addAttribute("locationURL", "/crew/page/"+crew.getCr_no());

		return "common/message";
	}
	
	@RequestMapping(value = "crew/crewUpdate", method = RequestMethod.POST)
	public String updateCrew(Crew crew, Model model) throws Exception {
		
		int updCnt = crewService.updateCrew(crew);
		
		model.addAttribute("isError", false);
		model.addAttribute("message", "정상적으로 수정하였습니다.");
		model.addAttribute("locationURL", "/crew/page/"+crew.getCr_no());
		
		return "common/message";
	}

}
