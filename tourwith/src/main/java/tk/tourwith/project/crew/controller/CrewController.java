package tk.tourwith.project.crew.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tk.tourwith.project.crew.model.Crew;
import tk.tourwith.project.crew.service.impl.CrewServiceImpl;

@Controller
public class CrewController {

	@Autowired
	CrewServiceImpl crewService;

	@RequestMapping("/crew/list/{category}")
	public String getCrewList(@PathVariable String category,
			                  @RequestParam(value="BIG_CATE_2",required=false) String city,
			                   @RequestParam(value="DATE_SELECT", required=false) String date , 
			                   Model model) throws Exception {

		Map<String, Object> paramMap = new HashMap<>();
		// BIG_CATE_{} by.bsp
		paramMap.put("category", category);
		if(StringUtils.isNotBlank(city)) {
			paramMap.put("city",  city );
		}
		if(StringUtils.isNotBlank(date)) {
			paramMap.put("date", date);
		}
		List<Crew> crewList = crewService.selectCrewList(paramMap);

		model.addAttribute(crewList);

		return "crew/crewList";
	}

	@RequestMapping("crew/page/{cr_no}")
	public String crewView(Model model, @RequestParam(value = "cr_no", required = false) String cr_no) throws Exception {
		
		Crew crew = null;

		crew = crewService.getCrew(cr_no);

		model.addAttribute("crew", crew);

		return "crew/crewView";
	}

	@RequestMapping("crew/form")
	public String crewForm(@RequestParam(value = "cr_no", required = false, defaultValue = "0") String cr_no,
			Model model) throws Exception {

		Crew crew = new Crew();

		model.addAttribute("crew", crew);

		return "crew/crewForm";
	}

	@RequestMapping(value = "crew/crewInsert", method = RequestMethod.POST)
	public String insertCrew(Crew crew, Model model) throws Exception {

		int updCnt = crewService.insertCrew(crew);

		return "crew/crewForm";
	}

}
