package tk.tourwith.project.help;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import tk.tourwith.project.code.model.Code;
import tk.tourwith.project.code.service.CodeService;
import tk.tourwith.project.help.model.Help;
import tk.tourwith.project.help.service.HelpService;

@Controller
public class HelpController {
	
// SG google api 활용 여행도우미 	
//	인스턴스를 생성
	@Autowired
	HelpService helpService;
	@Autowired
	CodeService codeService;
	
	@RequestMapping(value = "/helper", method = RequestMethod.GET)

		public String helphome(Model model)  {
			
			List<Code> codeList = codeService.selectListByGroupCode("BIG_CATE");
			
			model.addAttribute("codeList",codeList);
			
			return "help/mapList";
	}
	
	
	@RequestMapping(value = "/help/loc", method = RequestMethod.GET)
	@ResponseBody
		public Help helploc(String trplc_no)  {
			
			Help help = helpService.selectLoc(trplc_no);
			
//			model.addAttribute("codeList",help);
			
			return help;
	}
	
}
