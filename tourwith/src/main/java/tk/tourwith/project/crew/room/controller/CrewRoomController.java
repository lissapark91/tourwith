package tk.tourwith.project.crew.room.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import tk.tourwith.project.crew.model.Crew;
import tk.tourwith.project.crew.service.impl.CrewServiceImpl;

@Controller
public class CrewRoomController {
	
	@Autowired
	CrewServiceImpl crewService;
	
	@RequestMapping("/crew/room/{cr_no}")
	public String goCrewRoom(@PathVariable String cr_no, Model model) throws Exception {
		
		Crew crew = crewService.getCrew(cr_no);
		
		model.addAttribute("crew", crew);
		
		return "crew/crewRoom";
	}
}
