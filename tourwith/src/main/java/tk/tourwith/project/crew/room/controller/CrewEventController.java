package tk.tourwith.project.crew.room.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import tk.tourwith.project.code.service.impl.CodeServiceImpl;
import tk.tourwith.project.crew.model.Crew;
import tk.tourwith.project.crew.room.model.CrewEvent;
import tk.tourwith.project.crew.room.service.impl.CrewEventServiceImpl;
import tk.tourwith.project.crew.service.impl.CrewServiceImpl;
import tk.tourwith.project.member.model.CrAuthor;
import tk.tourwith.project.member.model.Member;
import tk.tourwith.project.member.service.impl.CrAuthorServiceImpl;
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
	
	@Autowired
	CrAuthorServiceImpl crAuthorService;
	
	@RequestMapping("/part/calendar/{cr_no}")
	public String getCrewEventList(@PathVariable("cr_no") String cr_no, Model model
			   						, HttpSession session
									) throws Exception{
		
				
		Member member = (Member) session.getAttribute("LOGIN_USER");
		
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("mb_no", member.getMb_no());
		paramMap.put("cr_no", cr_no);
		
		CrAuthor memberCrAuthor = crAuthorService.selectAuthorByMbNoCrNo(paramMap);
		System.out.println(memberCrAuthor);
		System.out.println(memberCrAuthor.getAuthor_group_code());
		
		if(StringUtils.equals(memberCrAuthor.getAuthor_group_code(), "CR_ROLE_REG")) {
			model.addAttribute("isCrewMember", true);
			Crew crew = crewService.getCrew(cr_no);
			
			model.addAttribute("crew", crew);
			model.addAttribute("member",member);
		}else {
			model.addAttribute("isCrewMember", false);
			System.out.println("throw new urlnotfound");
		}
		
		
		
		return "part/calendar";
	}
	
	@RequestMapping("/part/calendar/event/{cr_no}")
	@ResponseBody
	public List<CrewEvent> getCrewEventListtest(Model model/*,
								   String EVENT_NM,
								   String EVENT_CON,
								   String BGNDT,
								   String ENDDT*/,
								   @PathVariable String cr_no) throws Exception{
		
		Map<String, Object> param = new HashMap<>();
		param.put("cr_no", cr_no);
		List<CrewEvent> crewEventList = crewEventService.selectCrewEventList(param);
		
//		param.put("EVENT_CON", EVENT_CON);
//		param.put("BGNDT", BGNDT);
//		param.put("ENDDT", ENDDT);
//		
		model.addAttribute("crewEventList", crewEventList);
		
		return crewEventList;
	}
	
	@RequestMapping("/calendar/insert")
	@ResponseBody
	public int insertCrewEvent(Model model,
			 					CrewEvent crewEvent
							   ) throws Exception{
		int updcnt = crewEventService.insertCrewEvent(crewEvent);
		
		
		return updcnt;
	}
	
	@RequestMapping("/calendar/view")
	public String crewEventView(Model model,String event_no) throws Exception
	{
		CrewEvent crewEvent= crewEventService.getCrewEvent(event_no);
		
		return "part/calendar";
	}
	
	@RequestMapping("/calendar/update")
	@ResponseBody
	public int updateCrewEvent(Model model,String event_no,CrewEvent crewEvent)
	{
		
		
		int updcnt = 0;
		try {
			updcnt = crewEventService.updateCrewEvent(crewEvent);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return updcnt;
	}
	
	@RequestMapping("/calendar/delete")
	@ResponseBody
	public int deleteCrewEvent(Model model,String event_no)
	{	
		int updcnt = 0;
		System.out.println(event_no);
		try {
			updcnt = crewEventService.deletCrewEvent(event_no);
		} catch (Exception e) {
			
		}
		
		return updcnt;
		
	}
}
