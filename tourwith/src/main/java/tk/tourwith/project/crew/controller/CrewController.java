package tk.tourwith.project.crew.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tk.tourwith.project.code.model.Code;
import tk.tourwith.project.code.service.impl.CodeServiceImpl;
import tk.tourwith.project.crew.model.Crew;
import tk.tourwith.project.crew.service.impl.CrewServiceImpl;

@Controller
public class CrewController {

	@Autowired
	CrewServiceImpl crewService;
	@Autowired
	CodeServiceImpl codeService;

	@RequestMapping("/crew/list/{category}")
	public String getCrewList(@PathVariable String category, Model model) throws Exception {
		
		List<Code> codeList = codeService.selectListByGroupCode("BIG_CATE");
		
		
		Map<String, Object> paramMap = new HashMap<>();
		// BIG_CATE_{} by.bsp
		paramMap.put("category", String.format("BIG_CATE_%s", category));
		List<Crew> crewList = crewService.selectCrewList(paramMap);

		model.addAttribute("codeList",codeList);
		model.addAttribute(crewList);

		return "crew/crewList";
	}

	@RequestMapping("crew/page/{cr_no}")
	public String crewView(Model model, @PathVariable(value = "cr_no", required = true) String cr_no) throws Exception {
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
