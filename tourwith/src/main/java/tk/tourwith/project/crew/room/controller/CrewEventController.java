package tk.tourwith.project.crew.room.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import tk.tourwith.project.code.service.CodeService;
import tk.tourwith.project.crew.room.service.CrewEventService;
import tk.tourwith.project.crew.service.CrewService;
import tk.tourwith.project.member.service.MemberService;

public class CrewEventController {
	
	@Autowired
	CrewEventService crewEventService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	CodeService codeService;
	
	@Autowired
	CrewService crewService;
	
	@RequestMapping("/test/calendar")
	public String getCrewEventList(Model model) throws Exception{
		
		return "/test/calendar";
	}
}
