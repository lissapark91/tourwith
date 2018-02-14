package tk.tourwith.project.code;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CodeController {
	
	@RequestMapping(value = "/admin/codes", method = RequestMethod.GET)

	public String adminhome()  {
		
		
		
		return "admin/codeList";
	}
	
}
