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

	@RequestMapping("/reviews")
	public String getRevList(Model model) throws Exception {

		Map<String, Object> paramMap = new HashMap<>();
		
		List<Rev> revList = revService.selectRevList(paramMap);

		model.addAttribute("revList", revList);

		return "review/reviewList";
	}

	@RequestMapping("/review/{rev_no}")
	public String getRevView(@PathVariable(value = "rev_no", required = true) String rev_no, Model model)
			throws Exception {

		Rev rev = null;

		if (rev_no != null) {
			rev = revService.selectRev(rev_no);
		}
		System.out.println("========================");
		System.out.println(rev);
		System.out.println(rev.getSj());

		model.addAttribute("rev", rev);

		return "review/reviewView";

	}

}
