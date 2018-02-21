package tk.tourwith.project.faq.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tk.tourwith.project.faq.model.Faq;
import tk.tourwith.project.faq.service.impl.FaqServiceImpl;
import tk.tourwith.project.member.model.Member;
import tk.tourwith.project.util.PagingUtil;
import tk.tourwith.project.util.file.service.impl.FileServcieImpl;

@Controller
public class FaqController {

	@Autowired
	private FaqServiceImpl faqService;
	private FileServcieImpl fileService;

	// FAQ 검색
	@RequestMapping("/faq")
	public String faqList(
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
		int pageCount = 5;  // 기본값
		int totalCount = faqService.getTotalCnt(paramMap);
		
		
		
		PagingUtil pagingUtil = new PagingUtil(currentPage, totalCount, 15, 5);
		
		
		System.out.println( "================================");
		System.out.println( "getCurrentPage : " + pagingUtil.getCurrentPage());
		System.out.println( "getTotalCount : " + pagingUtil.getTotalCount());	
		System.out.println( "================================");

		
		
		
		paramMap.put("startRow", pagingUtil.getStartRow());
		paramMap.put("endRow", pagingUtil.getEndRow());
		
		List<Faq> faqList = faqService.selectFaqList(paramMap);

		model.addAttribute("faqList", faqList);
		model.addAttribute("pagingUtil", pagingUtil.getPageHtml().toString());

		return "faq/faqList";
	}

	// FAQ 글 보기
	@RequestMapping("/faq/{faq_no}")
	public String faqView(@PathVariable(value = "faq_no", required = true) String faq_no, Model model)
			throws Exception {

		Faq faq = null;

		faq = faqService.viewFaq(faq_no);

		model.addAttribute("faq", faq);

		return "faq/faqView";
	}

	// FAQ 글 작성
	@RequestMapping("/faq/form")
	public String faqForm(HttpSession session, @RequestParam(value = "faq_no", required = false) String faq_no,
			Model model) throws Exception {

		// Faq faq = null;

		if (StringUtils.isNotBlank(faq_no) && StringUtils.isNotEmpty(faq_no)) {

			// faq = faqService.viewFaq(faq_no);

			Faq faq = faqService.viewFaq(faq_no);
			model.addAttribute("faq", faq);

		}

		return "faq/faqForm";
	}

	@RequestMapping(value = "/faqInsert", method = RequestMethod.POST)
	public String faqInsert(HttpSession session, Faq faq, HttpServletRequest request, Model model) throws Exception {

		// 박보성 추가부분 : 이미지 태그 중 실제 반영된 부분만을 reg_yn = 'y'로 업데이트

		Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");
		Matcher matcher = pattern.matcher(faq.getCon());

		while (matcher.find()) {
			// 이미지 실제 등록된 것만 체크
			String file_no = matcher.group(1).substring(matcher.group(1).lastIndexOf("/") + 1);
			fileService.updateRegynByPk(file_no);
		}

		//////////////////////

		String viewPage = "common/message";

		Member member = (Member) session.getAttribute("LOGIN_USER");
		faq.setReg_mb_no(member.getMb_no());

		faqService.insertFaq(faq);

		boolean isError = false;
		String message = "정상 등록되었습니다.";
		String locationURL = "/faq";

		model.addAttribute("isError", isError);
		model.addAttribute("message", message);
		model.addAttribute("locationURL", locationURL);

		return viewPage;
	}

	// FAQ 수정
	@RequestMapping("/faqUpdate")
	public String faqUpdate(Faq faq, HttpSession session, HttpServletRequest request, Model model) throws Exception {

		// 로그인 여부 확인
		Member member = (Member) session.getAttribute("LOGIN_USER");

		// 세션에서 로그인 사용자 정보 셋팅.
		faq.setReg_mb_no(member.getMb_no());

		int updCnt = faqService.updateFaq(faq);

		String viewPage = "common/message";

		boolean isError = false;
		String message = "정상 수정되었습니다.";

		String locationURL = "/faq/" + faq.getFaq_no();

		model.addAttribute("isError", isError);
		model.addAttribute("message", message);
		model.addAttribute("locationURL", locationURL);

		return viewPage;
	}

	// FAQ 삭제
	@RequestMapping("/faq/faqDelete")
	public String faqDelete(Faq faq, HttpSession session, HttpServletRequest request,
			@RequestParam("faq_no") String faq_no, Model model) throws Exception {

		int updCnt = faqService.deleteFaq(faq);

		String viewPage = "common/message";

		boolean isError = false;
		String message = "정상 삭제되었습니다.";
		String locationURL = "/faq";

		model.addAttribute("isError", isError);
		model.addAttribute("message", message);
		model.addAttribute("locationURL", locationURL);

		return viewPage;
	}
}
