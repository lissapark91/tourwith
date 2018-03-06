package tk.tourwith.project.crew.room.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tk.tourwith.project.crew.room.service.CrewMapService;
import tk.tourwith.project.help.model.Help;

@Controller
public class CrewMapController {

	@Autowired
	CrewMapService crewMapService;

	@RequestMapping(value="/part/crewMap/{cr_no}", method=RequestMethod.GET)	
	public String CrewMap(@PathVariable("cr_no") String cr_no, Model model
			   , HttpSession session) throws Exception {
		
		
		tk.tourwith.project.crew.room.model.CrewMap crewMap = crewMapService.selectMapLoc4CrewNo(cr_no);
		
		model.addAttribute("crewMap", crewMap);
		return "part/crewMap";
	
	}
	
	
}
