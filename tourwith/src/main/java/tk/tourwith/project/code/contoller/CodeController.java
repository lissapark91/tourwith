package tk.tourwith.project.code.contoller;

import java.util.List;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tk.tourwith.project.code.model.Code;
import tk.tourwith.project.code.service.CodeService;

@Controller
public class CodeController {

	
	@RequestMapping(value = "/code", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
//		List<Code> code = CodeService.selectByGroupCode("BIG_CATE");
		
//		model.addAttribute("code", code);
		
		
		return "main";
	}
	
}
