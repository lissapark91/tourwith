package tk.tourwith.project.rev.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import tk.tourwith.project.rev.model.Rev;
import tk.tourwith.project.rev.service.impl.RevServiceImpl;

@Controller
public class RevController {
	
	@Autowired
	RevServiceImpl revService;
	
	@RequestMapping("/rev/{review}")
	public String getRevList(@PathVariable String review, Model model) throws Exception{
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("review", review);
		List<Rev> revList = revService.selectRevList(paramMap);
		
		model.addAllAttributes(revList);
		
		return "review/reviewList";
	}

}
