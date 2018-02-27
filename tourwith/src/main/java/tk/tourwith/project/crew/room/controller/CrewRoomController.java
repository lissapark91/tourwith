package tk.tourwith.project.crew.room.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CrewRoomController {
	
	@RequestMapping("/crew/room")
	public String goCrewRoom() {
		
		return "crew/crewRoom";
	}
}
