package tk.tourwith.project.rev.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import tk.tourwith.project.rev.model.RevReply;
import tk.tourwith.project.rev.service.impl.RevReplyServiceImpl;

@Controller
public class RevReplyController {
	
	@Autowired RevReplyServiceImpl revReplyService;
	
	// REVIEW 댓글 
	@RequestMapping("/review/reply/{rev_no}" )
	public String getRepView(@PathVariable(value = "rev_rply_no", required = true) String rev_rply_no, Model model)
		throws Exception{
		
		List<RevReply> rep = revReplyService.selectRepList(rev_rply_no);
		
		model.addAttribute("rep", rep);
		
		return "review/reviewView";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
