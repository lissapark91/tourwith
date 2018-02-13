package tk.tourwith.project.login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import tk.tourwith.project.member.model.Member;
import tk.tourwith.project.member.service.impl.MemberServiceImpl;

@Controller
public class LoginController {

	@Autowired
	MemberServiceImpl memberService;
	
	@RequestMapping(value="/login/{fb_id}")
	public String memberCheck(@PathVariable String fb_id, Model model) throws Exception {
		
		Member member = memberService.selectMemberById(fb_id);
		
		boolean isError = true;
		String locationURL = "/member/form";
		
		if(member != null) {
			isError = false;		
		}
		
		model.addAttribute(isError);
		model.addAttribute(locationURL);

		return "common/redirect";
	}
	
	
}
