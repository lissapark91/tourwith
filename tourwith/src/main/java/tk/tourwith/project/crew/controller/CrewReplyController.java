package tk.tourwith.project.crew.controller;

import static org.hamcrest.CoreMatchers.startsWith;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import tk.tourwith.project.crew.model.Crew;
import tk.tourwith.project.crew.model.CrewReply;
import tk.tourwith.project.crew.service.impl.CrewReplyServiceImpl;
import tk.tourwith.project.member.model.Member;
import tk.tourwith.project.member.service.impl.MemberServiceImpl;

@Controller
public class CrewReplyController {

	@Autowired
	CrewReplyServiceImpl crewReplyService;
	@Autowired
	MemberServiceImpl memberService;
	
	@ResponseBody
	@RequestMapping("/crew/reply/{cr_no}")
	public Map<String,Object> selectCrewReplyList(@PathVariable String cr_no) throws Exception{
		
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("cr_no", cr_no);
		
		
		List<CrewReply> crewReplyList = crewReplyService.crewReplyList(paramMap);
		
		Map<String,Object> model= new HashMap<String, Object>();
		
		model.put("crewReplyList", crewReplyList);
		
		return model;
	}
	
	@ResponseBody
	@RequestMapping("/crew/reply/insert")
	public Map<String,Object> insertCrewReply(String con1, String con2, String cr_no,
			String parnts_rply_no,
			HttpSession session) throws Exception{
		
		CrewReply crewReply = new CrewReply();
		Map<String,Object> model= new HashMap<String, Object>();
		
		crewReply.setCr_no(cr_no);
		
		Member member = (Member) session.getAttribute("LOGIN_USER");
		
		crewReply.setWritng_mb_no(member.getMb_no());
		
//		crewReply.setParnts_rply_no("");
		
		
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("cr_no", cr_no);
		
		if(StringUtils.isNotEmpty(con1) && StringUtils.isNotBlank(con1)) {
			
			crewReply.setCon(con1);
			crewReplyService.insertCrewReply(crewReply);
			model.put("message", "댓글을 등록하였습니다.");
			
		}else if(StringUtils.isNotBlank(con2) && StringUtils.isNotEmpty(con2)) {
			//대댓글
			//부모댓글 넘버 필요...
			if(StringUtils.isNotBlank(parnts_rply_no) && StringUtils.isNotEmpty(parnts_rply_no)) {
				crewReply.setCon(con2);
				crewReply.setParnts_rply_no(parnts_rply_no);
				crewReplyService.insertCrewReply(crewReply);
				model.put("message", "댓글을 등록하였습니다.");
			}
			
		}else {
			model.put("message", "댓글 등록을 실패하였습니다.");
		}
		
	
		
		List<CrewReply> crewReplyList = crewReplyService.crewReplyList(paramMap);
		
		model.put("crewReplyList", crewReplyList);
		
		return model;
	}
	
	@ResponseBody
	@RequestMapping("/crew/reply/update")
	public Map<String, Object> updateCrewReply(String cr_rply_no, String con1, HttpSession session) throws Exception{
		Member member = (Member) session.getAttribute("LOGIN_USER");
		CrewReply crewReply = crewReplyService.selectCrewReplyByPk(cr_rply_no);
		
		// if login user equals reply writer
		if(StringUtils.equals(member.getMb_no(), crewReply.getWritng_mb_no())) {

			if(StringUtils.isNotBlank(con1) && StringUtils.isNotEmpty(con1)) {

				crewReply.setCon(con1);
				crewReplyService.updateCrewReply(crewReply);
				
			}
			
		}
		

		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("cr_no", crewReply.getCr_no());
		
		List<CrewReply> crewReplyList = crewReplyService.crewReplyList(paramMap);
		
		Map<String,Object> model= new HashMap<String, Object>();
		
		model.put("crewReplyList", crewReplyList);
		
		return model;
		
	}
	
	@ResponseBody
	@RequestMapping("/crew/reply/delete")
	public Map<String, Object> deleteCrewReply(String cr_rply_no, HttpSession session) throws Exception{
		Member member = (Member) session.getAttribute("LOGIN_USER");
		CrewReply crewReply = crewReplyService.selectCrewReplyByPk(cr_rply_no);
		
		// if login user equals reply writer
		if(StringUtils.equals(member.getMb_no(), crewReply.getWritng_mb_no())) {
			
				
				crewReplyService.deleteCrewReply(cr_rply_no);
				
			
		}
		
		
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("cr_no", crewReply.getCr_no());
		
		List<CrewReply> crewReplyList = crewReplyService.crewReplyList(paramMap);
		
		Map<String,Object> model= new HashMap<String, Object>();
		
		model.put("crewReplyList", crewReplyList);
		
		return model;
		
	}
	
	
	
	
}
