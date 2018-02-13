package tk.tourwith.project.faq.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import tk.tourwith.project.faq.model.Faq;
import tk.tourwith.project.faq.service.FaqService;

@Controller
public class FaqController {
	
	@Autowired
	private FaqService faqService;	
	
	@RequestMapping("/faq")
	public String getFaqList(Model model) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<>();
		List<Faq> faqList = faqService.selectFaqList(paramMap);
		
		model.addAttribute(faqList);
		
		return "faq/faqList";
	}
	
	

}