package tk.tourwith.project.crew.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tk.tourwith.project.crew.model.CrewNotice;
import tk.tourwith.project.crew.service.CrewNoticeService;
import tk.tourwith.project.member.model.Member;
import tk.tourwith.project.util.PagingUtil;
import tk.tourwith.project.util.file.service.impl.FileServcieImpl;

@Controller
public class CrewNoticeController {
	
	@Autowired
	CrewNoticeService crewNoticeService;
	
	@RequestMapping("/crewNotices/{cr_no}")
	public String crewNoticeList(
			@RequestParam(value="searchType",required=false, defaultValue="") String searchType,
			@RequestParam(value="searchWord",required=false, defaultValue="") String searchWord,
			@RequestParam(value="currentPage",required=false, defaultValue="1") int currentPage,
			@PathVariable("cr_no") String cr_no,
			Model model
			)throws Exception {
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("cr_no", cr_no);
		
		if(StringUtils.isNotBlank(searchType)&& StringUtils.isNotBlank(searchWord)) {
			paramMap.put("searchType", searchType);
			paramMap.put("searchWord", searchWord);
		}
		
		//페이징 처리 데이터
		int pageCount = 5;
		int totalCount = crewNoticeService.getTotalCnt(paramMap);
		
		PagingUtil pagingUtil = new PagingUtil(currentPage,totalCount, 4, 5);
		
		System.out.println( "================================");
		System.out.println( "getCurrentPage : " + pagingUtil.getCurrentPage());
		System.out.println( "getTotalCount : " + pagingUtil.getTotalCount());	
		System.out.println( "================================");
		
		paramMap.put("startRow", pagingUtil.getStartRow());
		paramMap.put("endRow", pagingUtil.getEndRow());
		
		List<CrewNotice> crewNoticeList = crewNoticeService.selectCrewNoticeList(paramMap);
		
		model.addAttribute("crewNoticeList",crewNoticeList);
		model.addAttribute("pagingUtil",pagingUtil);
		
		model.addAttribute("cr_no",cr_no);
		return "crew/crewNoticeList";
	}
	
	@RequestMapping("/crewNotice/{notice_no}")
	public String crewNoticeView(@PathVariable(value = "notice_no", required = true)String notice_no, Model model,@RequestParam(value="cr_no", required = false) String cr_no)
			throws Exception{
		
		CrewNotice crewNotice = null;
		
		crewNotice = crewNoticeService.selectCrewNotice(notice_no);
		
		Map<String, Object> paramMap = new HashMap<>();
		
		//paramMap.put("cr_no", cr_no);
		
		model.addAttribute("crewNotice",crewNotice);
		
		model.addAttribute("cr_no",cr_no);
		
		return "crew/crewNoticeView";
	}
	
	@RequestMapping("/crewNotice/form")
	public String crewNoticeForm(HttpSession session, 
			@RequestParam(value="notice_no", required = false) String notice_no,HttpServletRequest request, CrewNotice crewNotice,
			Model model )throws Exception{
		
		if (StringUtils.isNotBlank(notice_no) && StringUtils.isNotEmpty(notice_no)) {

			crewNotice = crewNoticeService.selectCrewNotice(notice_no);
			model.addAttribute("crewNotice", crewNotice);

		}
		
		
		return "crew/crewNoticeForm";
	}
	
	@RequestMapping(value = "/crewNoticeInsert", method = RequestMethod.POST)
	public String crewNoticeInsert(HttpSession session, CrewNotice crewNotice, HttpServletRequest request, Model model
			,String cr_no
			) throws Exception{
		
		String viewPage = "common/message";
		
		Member member = (Member) session.getAttribute("LOGIN_USER");
		
		crewNotice.setCr_no(cr_no);
		
		crewNotice.setWrter(member.getMb_no());
		
		crewNoticeService.insertCrewNotice(crewNotice);
		
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("cr_no", cr_no);
		
		boolean isError = false;
		String message = "정상 등록되었습니다.";
		String locationURL = "/crewNotices/" +cr_no;
		
		model.addAttribute("isError", isError);
		model.addAttribute("message", message);
		model.addAttribute("locationURL", locationURL);
		
		return viewPage;
		
	}
	
	@RequestMapping("/crewNoticeUpdate")
	public String crewNoticeUpdate(CrewNotice crewNotice, HttpSession session, HttpServletRequest request,
			Model model) throws Exception{
		
		// 로그인 여부 확인
		Member member = (Member)session.getAttribute("LOGIN_USER");
		
		// 세션에서 로그인 사용자 정보 셋팅
		crewNotice.setWrter(member.getMb_no());
		
		int updCnt = crewNoticeService.updateCrew(crewNotice);
		
		String viewPage = "common/message";
		
		boolean isError = false;
		String message = "정상 수정되었습니다.";
		
		String locationURL = "/crewNotice/"+ crewNotice.getNotice_no();
		
		model.addAttribute("isError",isError);
		model.addAttribute("message",message);
		model.addAttribute("locationURL",locationURL);
		
		
		return viewPage;
	}
	
	@RequestMapping("/crewNotice/crewDelete")
	public String crewNoticeDelect(CrewNotice crewNotice, HttpSession session, HttpServletRequest request,
			@RequestParam("notice_no") String notice_no, @RequestParam("cr_no") String cr_no, Model model) throws Exception{
		
		int updCnt = crewNoticeService.deletCrewNotice(notice_no);
		
		String viewPage = "common/message";
		
		boolean isError = false;
		String message = "정상 삭제되었습니다.";
		String locationURL = "/crewNotices/"+cr_no;
		
		model.addAttribute("isError", isError);
		model.addAttribute("message", message);
		model.addAttribute("locationURL", locationURL);
		
		model.addAttribute("cr_no", cr_no);
		
		return viewPage;
	}
}
