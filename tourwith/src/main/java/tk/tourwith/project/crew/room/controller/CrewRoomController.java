package tk.tourwith.project.crew.room.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CrewRoomController {
	
	@RequestMapping("/crew/room/{cr_no}")
	public String goCrewRoom(@PathVariable String cr_no) {
		
		return "crew/crewRoom";
	}
}
