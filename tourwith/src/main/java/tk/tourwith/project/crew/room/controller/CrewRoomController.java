package tk.tourwith.project.crew.room.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import tk.tourwith.project.member.model.Member;

@Controller
public class CrewRoomController {
	
	@RequestMapping("/crew/room/{cr_no}")
	public String goCrewRoom(@PathVariable String cr_no
										  ,HttpSession session) {
		
		Member member = (Member)session.getAttribute("LOGIN_USER");
		
		return "crew/crewRoom";
	}
}
