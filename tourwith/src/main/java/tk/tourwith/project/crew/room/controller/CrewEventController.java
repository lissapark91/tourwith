package tk.tourwith.project.crew.room.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import tk.tourwith.project.code.service.impl.CodeServiceImpl;
import tk.tourwith.project.crew.room.model.CrewEvent;
import tk.tourwith.project.crew.room.service.impl.CrewEventServiceImpl;
import tk.tourwith.project.crew.service.impl.CrewServiceImpl;
import tk.tourwith.project.member.service.impl.MemberServiceImpl;

@Controller
public class CrewEventController {
	
	@Autowired
	CrewEventServiceImpl crewEventService;
	
	@Autowired
	MemberServiceImpl memberService;
	
	@Autowired
	CodeServiceImpl codeService;
	
	@Autowired
	CrewServiceImpl crewService;
	
	@RequestMapping("/test/calendar")
	public String getCrewEventList(Model model
								   ) throws Exception{
		
		
		return "test/calendar";
	}
	
	@RequestMapping("/test/calendar/event/{CR_NO}")
	@ResponseBody
	public List<CrewEvent> getCrewEventListtest(Model model/*,
								   String EVENT_NM,
								   String EVENT_CON,
								   String BGNDT,
								   String ENDDT*/,
								   @PathVariable String CR_NO) throws Exception{
		
		Map<String, Object> param = new HashMap<>();
		param.put("cr_no", CR_NO);
		List<CrewEvent> crewEventList = crewEventService.selectCrewEventList(param);
		
//		param.put("EVENT_CON", EVENT_CON);
//		param.put("BGNDT", BGNDT);
//		param.put("ENDDT", ENDDT);
//		
		model.addAttribute("crewEventList", crewEventList);
		
		return crewEventList;
	}
	
	@RequestMapping("/test/calendar/insert")
	@ResponseBody
	public int insertCrewEvent(Model model,
			 					CrewEvent crewEvent
							   ) throws Exception{
		int updcnt = crewEventService.insertCrewEvent(crewEvent);
		
		
		return updcnt;
	}
	
	@RequestMapping("/test/calendar/view")
	public String crewEventView(Model model,String event_no) throws Exception
	{
		CrewEvent crewEvent= crewEventService.getCrewEvent(event_no);
		
		return "test/calendar";
	}
	
	@RequestMapping("/update")
	public int updateCrewEvent(Model model)
	{
		return 0;
	}
	@RequestMapping("/delete")
	@ResponseBody
	public int deleteCrewEvent(Model model)
	{
		return 0;
		
	}
}
