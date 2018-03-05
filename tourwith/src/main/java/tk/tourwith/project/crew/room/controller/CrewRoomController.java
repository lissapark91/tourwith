package tk.tourwith.project.crew.room.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.codec.binary.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import tk.tourwith.project.crew.model.Crew;
import tk.tourwith.project.crew.service.impl.CrewServiceImpl;
import tk.tourwith.project.member.model.CrAuthor;
import tk.tourwith.project.member.model.Member;
import tk.tourwith.project.member.service.impl.CrAuthorServiceImpl;
import tk.tourwith.project.member.service.impl.MemberServiceImpl;

@Controller
public class CrewRoomController {
	
	@Autowired
	CrewServiceImpl crewService;
	@Autowired
	CrAuthorServiceImpl crAuthorService;
	@Autowired
	MemberServiceImpl memberService;
	
	@RequestMapping("/crew/room/{cr_no}")
	public String goCrewRoom(@PathVariable String cr_no, Model model) throws Exception {
		
		Crew crew = crewService.getCrew(cr_no);
		
		model.addAttribute("crew", crew);
		
		List<CrAuthor> authorList = crAuthorService.selectListByCrNo(cr_no);

		List<Member> memberList = new ArrayList<>();
		
		for(CrAuthor author : authorList) {
			//가입이 된 사람
			if(StringUtils.equals(author.getAuthor_group_code(), "CR_ROLE_REG")){
				Member member = memberService.selectMemberByPK(author.getMb_no());
				memberList.add(member);
			}
		}
		
		
		model.addAttribute("memberList", memberList);
		
		return "crew/crewRoom";
	}
	
	
	///크루에 가입한 멤버들
	
	@RequestMapping("/part/member/{cr_no}")
	public String getCrewMember(@PathVariable String cr_no, Model model) throws Exception {
		
		List<CrAuthor> authorList = crAuthorService.selectListByCrNo(cr_no);

		List<Member> memberList = new ArrayList<>();
		
		for(CrAuthor author : authorList) {
			//가입이 된 사람
			if(StringUtils.equals(author.getAuthor_group_code(), "CR_ROLE_REG")){
				Member member = memberService.selectMemberByPK(author.getMb_no());
				memberList.add(member);
			}
		}
		
		
		model.addAttribute("memberList", memberList);
		
		
		
		return "part/crewMember";
	}
	
	
}
