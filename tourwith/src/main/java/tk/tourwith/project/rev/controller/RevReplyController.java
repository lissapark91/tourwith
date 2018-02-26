package tk.tourwith.project.rev.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import tk.tourwith.project.crew.model.CrewReply;
import tk.tourwith.project.member.model.Member;
import tk.tourwith.project.rev.model.RevReply;
import tk.tourwith.project.rev.service.impl.RevReplyServiceImpl;

@Controller
public class RevReplyController {
	
	@Autowired 
	RevReplyServiceImpl revReplyService;
	
	
	@ResponseBody
	@RequestMapping("/review/reply/{rev_no}")
	public Map<String, Object> selectRevReplyList(@PathVariable String rev_no) throws Exception{
		
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("rev_no", rev_no);
		
		List<RevReply> revReplyList = revReplyService.selectRepList(paramMap);
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("revReplyList", revReplyList);
	
		return model;
	}
	
	
	@ResponseBody
	@RequestMapping("/review/reply/insert")
	public Map<String, Object> insertRevReply(String con1, String con2, String rev_no,
		HttpSession session, String parnts_rply_no) throws Exception{
		
		RevReply revReply = new RevReply();
		
		revReply.setRev_no(rev_no);
		
		Member member = (Member) session.getAttribute("LOGIN_USER");
		
		revReply.setWritng_mb_no(member.getMb_no());
		
		Map<String, Object> model = new HashMap<String, Object>();

		if(StringUtils.isNotEmpty(con1) && StringUtils.isNotBlank(con1)) {
			
			revReply.setCon(con1);
			revReplyService.insertRep(revReply);
			model.put("message", "댓글을 등록하였습니다.");
			
		}else if(StringUtils.isNotEmpty(con2) && StringUtils.isNotBlank(con2)) {
			
			// 대댓글, 부모댓글 요구
			if(StringUtils.isNotBlank(parnts_rply_no) && StringUtils.isNotEmpty(parnts_rply_no)) {
				revReply.setCon(con2);
				revReply.setParnts_rply_no(parnts_rply_no);
				revReplyService.insertRep(revReply);
				model.put("message", "댓글을 등록하였습니다.");
			}
		}else {
			model.put("message", "댓글 등록을 실패하였습니다.");
		}
		
		
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("rev_no", rev_no);
		
		List<RevReply> revReplyList = revReplyService.selectRepList(paramMap);
		
		
		model.put("revReplyList", revReplyList);
		
		return model;
	}
	
	
	@ResponseBody
	@RequestMapping("/review/reply/update")
	public Map<String, Object> updateRevReply(String rev_rply_no, String con1, HttpSession session) throws Exception{
		Member member = (Member) session.getAttribute("LOGIN_USER");
		RevReply revReply = revReplyService.selectRevReplyByPk(rev_rply_no);
		
		// if login user equals reply writer
		if(StringUtils.equals(member.getMb_no(), revReply.getWritng_mb_no())) {

			if(StringUtils.isNotBlank(con1) && StringUtils.isNotEmpty(con1)) {

				revReply.setCon(con1);
				revReplyService.updateRep(revReply);
				
			}
			
		}
		

		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("rev_no", revReply.getRev_no());
		
		List<RevReply> revReplyList = revReplyService.selectRepList(paramMap);
		
		Map<String,Object> model= new HashMap<String, Object>();
		
		model.put("revReplyList", revReplyList);
		
		return model;
		
	}
	
	@ResponseBody
	@RequestMapping("/review/reply/delete")
	public Map<String, Object> deleteRevReply(String rev_rply_no, HttpSession session) throws Exception{
		Member member = (Member) session.getAttribute("LOGIN_USER");
		RevReply revReply = revReplyService.selectRevReplyByPk(rev_rply_no);
		
		// if login user equals reply writer
		if(StringUtils.equals(member.getMb_no(), revReply.getWritng_mb_no())) {
			
				
				revReplyService.deleteRep(revReply);
				
			
		}
		
		
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("rev_no", revReply.getRev_no());
		
		List<RevReply> revReplyList = revReplyService.selectRepList(paramMap);
		
		Map<String,Object> model= new HashMap<String, Object>();
		
		model.put("revReplyList", revReplyList);
		
		return model;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
