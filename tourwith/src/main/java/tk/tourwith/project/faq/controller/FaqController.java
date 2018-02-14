package tk.tourwith.project.faq.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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



import tk.tourwith.project.faq.model.Faq;
import tk.tourwith.project.faq.service.impl.FaqServiceImpl;
import tk.tourwith.project.member.model.Member;



@Controller
public class FaqController {
	
	@Autowired
	private FaqServiceImpl faqService;	
	
	// FAQ 조회
	@RequestMapping("/faq")
	public String getFaqList(Model model) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<>();
		List<Faq> faqList = faqService.selectFaqList(paramMap);
		
		model.addAttribute(faqList);
		
		return "faq/faqList";
	}
	
	// FAQ 검색
	@RequestMapping("/faqList")
	public String faqList(
			@RequestParam(value="searchType", required=false, defaultValue="") String searchType,
			@RequestParam(value="searchWord", required=false, defaultValue="") String searchWord,
			Model model
	) throws Exception {

		Map<String, Object> paramMap = new HashMap<>();
		
		if(StringUtils.isNotBlank(searchType) && StringUtils.isNotBlank(searchWord)) {
			paramMap.put("searchType", searchType);
			paramMap.put("searchWord", searchWord);
		}

		List<Faq> faqList = faqService.selectFaqList(paramMap);

		model.addAttribute("faqList", faqList);

		return "faq/faqList";
	}
	
	// FAQ 글 보기
	@RequestMapping("/faqView/{faq_no}")
	public String faqView(
			@PathVariable(value="faq_no", required=true) String faq_no,
			Model model
			) throws Exception {		
		
		Faq faq = null;
								
			faq = faqService.viewFaq(faq_no);

		
		model.addAttribute("faq", faq);
		
		return "faq/faqView";		
	}
	
	// FAQ 글 작성
	@RequestMapping("/faq/faqForm")
	public String faqForm(
			HttpSession session,
			Faq faq,
			Model model
			) throws Exception {

		// 관리자 로그인 멤버 아직 구현 X		
		/*		
		// 로그인 여부 확인		
		Member member = (Member)session.getAttribute("LOGIN_USER");
		
		int updCnt = 0;
		
		if(faq != null) {
		
			// 로그인 사용자 정보
			faq.setReg_mb_no(member.getMb_no());
			
			updCnt = faqService.insertFaq(faq);
		}
		
		model.addAttribute("faq", faq);
*/		
		return "faq/faqForm";
	}
	
	@RequestMapping(value="/faqInsert", method=RequestMethod.POST)
	public String faqInsert(
			
			Faq faq,
			HttpServletRequest request,
			Model model
			) throws Exception {
				
		String viewPage = "common/message";
		
		boolean isError = false;
		String message = "정상 등록되었습니다.";
		String locationURL = "/board/boardList.do";
		
		model.addAttribute("isError", isError);
		model.addAttribute("message", message);
		model.addAttribute("locationURL", locationURL);
		
		return viewPage;
	}
	
	
	// FAQ 수정
	@RequestMapping("/faqUpdate")
	public String faqUpdate(
			Faq faq,
			HttpSession session,
			HttpServletRequest request,
			Model model
			) throws Exception {
						
		// 로그인 여부 확인
		Member member = (Member)session.getAttribute("LOGIN_USER");
		
		
		// 세션에서 로그인 사용자 정보 셋팅.
		faq.setReg_mb_no(member.getMb_no());
		
		String viewPage = "common/message";
		
		boolean isError = false;
		String message = "정상 수정되었습니다.";
		String locationURL = "/faq/faqView/" + faq.getReg_mb_no();
		
		model.addAttribute("isError", isError);
		model.addAttribute("message", message);
		model.addAttribute("locationURL", locationURL);
		
		return viewPage;
	}
	
	
	// FAQ 삭제
	@RequestMapping("/faqDelete")
	public String faqDelete(
			HttpSession session,
			@RequestParam("faq_no") String faq_no,
			Model model
			) {
		
		// 로그인 여부 확인
		Member member = (Member)session.getAttribute("LOGIN_USER");
		
		if(member == null) {
			return "redirect:/login/loginForm";
		}
		
		String viewPage = "common/message";
		
		boolean isError = false;
		String message = "정상 삭제되었습니다.";
		String locationURL = "/faq/faqList";
		
		try {
						
			Map<String, Object> paramMap = new HashMap<>();
			
			if(faq_no == null) {
				
				paramMap.put("faq_no", faq_no);		
				
				int updCnt = faqService.deleteFaq(paramMap);
				
				if(updCnt == 0) {
					isError = true;
					message = "삭제 실패하였습니다.";
				}
			}else {
				isError = true;
				message = "삭제 대상이 없습니다.";
			}			
			
		}catch(Exception e) {
			isError = true;
			message = "삭제 실패하였습니다.";
		}
		
		model.addAttribute("isError", isError);
		model.addAttribute("message", message);
		model.addAttribute("locationURL", locationURL);
		
		return viewPage;
	}
}
