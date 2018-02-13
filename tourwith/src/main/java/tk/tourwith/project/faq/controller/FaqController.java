package tk.tourwith.project.faq.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;



import tk.tourwith.project.faq.model.Faq;
import tk.tourwith.project.faq.service.impl.FaqServiceImpl;



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
	public String boardView(
			@PathVariable(value="faq_no", required=true) String faq_no,
			Model model
			) throws Exception {		
		
		Faq faq = null;
		
		if(faq_no == null) {						
			faq = faqService.viewFaq(faq_no);
		}
		
		model.addAttribute("faq", faq);
		
		return "faq/faqView";		
	}
	
	
	
	
}
