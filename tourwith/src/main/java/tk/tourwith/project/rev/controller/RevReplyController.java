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
		HttpSession session) throws Exception{
		
		RevReply revReply = new RevReply();
		
		if(StringUtils.isNotEmpty(con1) && StringUtils.isNotBlank(con1)) {
			
			revReply.setCon(con1);
		}else if(StringUtils.isNotEmpty(con2) && StringUtils.isNotBlank(con2)) {
			
			// 대댓글, 부모댓글 요구
			revReply.setCon(con2);
		}
		
		revReply.setRev_no(rev_no);
		
		Member member = (Member) session.getAttribute("LOGIN_USER");
		
		revReply.setWritng_mb_no(member.getMb_no());
		
		revReply.setParnts_rply_no("");
		
		revReplyService.insertRep(revReply);
		
		
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("rev_no", rev_no);
		
		List<RevReply> revReplyList = revReplyService.selectRepList(paramMap);
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("revReplyList", revReplyList);
		
		return model;
	}
	
	
	@ResponseBody
	@RequestMapping("/review/reply/update")
	public Map<String, Object> updateRevReply(String rev_rply_no){
		
		
		
		return null;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
