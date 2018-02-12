package tk.tourwith.project.crew.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import tk.tourwith.project.crew.model.Crew;
import tk.tourwith.project.crew.service.impl.CrewServiceImpl;

@Controller
public class CrewController {
	
	@Autowired
	CrewServiceImpl crewService;	
	
	@RequestMapping("/crew/{category}")
	public String getCrewList(@PathVariable String category, Model model) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("category", category);
		List<Crew> crewList = crewService.selectCrewList(paramMap);
		
		model.addAttribute(crewList);
		
		return "crew/crewList";
	}
	
	

}
