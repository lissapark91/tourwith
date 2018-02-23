package tk.tourwith.project.crew.room.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import tk.tourwith.project.code.service.CodeService;
import tk.tourwith.project.crew.room.service.CrewEventService;
import tk.tourwith.project.crew.service.CrewService;
import tk.tourwith.project.member.service.MemberService;

@Controller
public class CrewEventController {
	
	@Autowired
	CrewEventService crewEventService;
	
	@Autowired
	CrewService crewService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	CodeService codeService;
	
	@RequestMapping("/test/calendar")
	public String getCrewEventList(Model model) throws Exception{
		
		return "/test/calendar";
	}

}
