package tk.tourwith.project;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import tk.tourwith.project.code.model.Code;
import tk.tourwith.project.code.service.impl.CodeServiceImpl;

@Controller
public class mainController {

	@Autowired
	CodeServiceImpl codeService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {
		
		List<Code> codeList = codeService.selectByGroupCode("BIG_CATE");
		
		model.addAttribute(codeList);
		
		
		return "main";
	}
	
	
	@RequestMapping(value="/cate", method = RequestMethod.GET)
	@ResponseBody
	public String nextCate(Locale locale, Model model) throws Exception {
		
		List<Code> codeList = codeService.selectByGroupCode("BIG_CATE");
		
		model.addAttribute(codeList);
		
		
		return "main";
	}

	
	
}
