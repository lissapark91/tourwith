package tk.tourwith.project.rev.controller;

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

import tk.tourwith.project.member.model.Member;
import tk.tourwith.project.rev.model.Rev;
import tk.tourwith.project.rev.service.impl.RevServiceImpl;
import tk.tourwith.project.util.PagingUtil;
import tk.tourwith.project.util.file.service.impl.FileServcieImpl;

@Controller
public class RevController {

	@Autowired
	private RevServiceImpl revService;
	private FileServcieImpl fileService;

	// REV 검색
	@RequestMapping("/review")
	public String getRevList(
			@RequestParam(value="searchType", required=false, defaultValue="") String searchType,
			@RequestParam(value="searchWord", required=false, defaultValue="") String searchWord,
			@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
			Model model
	) throws Exception {

		Map<String, Object> paramMap = new HashMap<>();
		
		if(StringUtils.isNotBlank(searchType) && StringUtils.isNotBlank(searchWord)) {
			paramMap.put("searchType", searchType);
			paramMap.put("searchWord", searchWord);
		}
		
		// 페이징 처리 데이터
		int pageCount = 5;
		int totalCount = revService.getTotalCnt(paramMap);
		
		
		
		PagingUtil pagingUtil = new PagingUtil(currentPage, totalCount, 15, 5);
		
		paramMap.put("startRow", pagingUtil.getStartRow());
		paramMap.put("endRow", pagingUtil.getEndRow());
		
		List<Rev> revList = revService.selectRevList(paramMap);
		
		System.out.println( "================================");
		System.out.println( "getCurrentPage : " + pagingUtil.getCurrentPage());
		System.out.println( "getTotalCount : " + pagingUtil.getTotalCount());	
		System.out.println( "================================");
		
		model.addAttribute("revList", revList);
		model.addAttribute("pagingUtil", pagingUtil.getPageHtml().toString());

		return "review/reviewList";
	}
	
	// REV 글 보기
	@RequestMapping("/review/{rev_no}")
	public String getRevView(@PathVariable(value = "rev_no", required = true) String rev_no, Model model)
			throws Exception {

		Rev rev = null;

		rev = revService.selectRev(rev_no);
		
		model.addAttribute("rev", rev);

		return "review/reviewView";
	}
	
	// REV 글 작성
	@RequestMapping("/review/form")
	public String revForm(HttpSession session, 
			@RequestParam(value = "rev_no", required = false) String rev_no,
			Model model) throws Exception{
		
		if(StringUtils.isNotBlank(rev_no) && StringUtils.isNotEmpty(rev_no)) {
			
			Rev rev = revService.selectRev(rev_no);
			model.addAttribute("rev", rev);
			
		}
		
			return "review/reviewForm";
		}
	
	@RequestMapping(value = "/revInsert", method = RequestMethod.POST)
	public String revInsert(HttpSession session, Rev rev, HttpServletRequest request, Model model) throws Exception{
		
		// 이미지 태그 중 실제 반영된 부분만을 등록여부 = 'y'로 업데이트
		Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");
		Matcher matcher = pattern.matcher(rev.getCon());
		
		while (matcher.find()) {
			// 실제 이미지 등록만 체크
			String file_no = matcher.group(1).substring(matcher.group(1).lastIndexOf("/") + 1);
			fileService.updateRegynByPk(file_no);
		}
		
		String viewPage = "common/message";
		
		Member member = (Member) session.getAttribute("LOGIN_USER");
		rev.setRev_writng_mb_no(member.getMb_no());
		
		revService.insertRev(rev);
		
		boolean isError = false;
		String message = "정상 등록되었습니다.";
		String locationURL = "/review";
		
		model.addAttribute("isError", isError);
		model.addAttribute("message", message);
		model.addAttribute("locationURL", locationURL);
		
		return viewPage;
	}
	
	// REV 수정
	@RequestMapping("/revUpdate")
	public String revUpdate(Rev rev, HttpSession session, HttpServletRequest request, Model model) throws Exception {

		// 로그인 여부 확인
		Member member = (Member)session.getAttribute("LOGIN_USER");
		
		// 세션에서 로그인 사용자 세팅.
		rev.setRev_writng_mb_no(member.getMb_no());
		
		int updCnt = revService.updateRev(rev);
		
		String viewPage = "common/message";
		
		boolean isError = false;
		String message = "정상 수정되었습니다.";
		
		String locationURL = "/review/" + rev.getRev_no();
		
		model.addAttribute("isError", isError);
		model.addAttribute("message", message);
		model.addAttribute("locationURL", locationURL);
		
		return viewPage;
	}
	
	
	// REVIEW 삭제
	@RequestMapping("/review/revDelete")
	public String revDelete(Rev rev, HttpSession session, HttpServletRequest request, 
			@RequestParam("rev_no") String rev_no, Model model) throws Exception {
		
		int updCnt = revService.deleteRev(rev);
		
		String viewPage = "common/message";
		
		boolean isError = false;
		String message = "정상 삭제되었습니다.";
		String locationURL = "/review";
		
		
		model.addAttribute("isError", isError);
		model.addAttribute("message", message);
		model.addAttribute("locationURL", locationURL);
		
		return viewPage;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}



