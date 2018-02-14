package tk.tourwith.project.login.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.velocity.exception.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tk.tourwith.project.member.model.Member;
import tk.tourwith.project.member.service.impl.MemberServiceImpl;

@Controller
public class LoginController {

	@Autowired
	MemberServiceImpl memberService;
	
	@ResponseBody
	@RequestMapping(value="/check/{fb_id}")
	public Map<String, Object> memberCheck(@PathVariable String fb_id, Model model,
			Member member
			) throws Exception {
		
		Member member_check = memberService.selectMemberById(fb_id);
		
		boolean isMember = false;
		
		if(member_check != null) {
			isMember = true;		
		}
			
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("isMember", isMember);
//		resultMap.put("member", member);
		
		return resultMap;
	}

	@RequestMapping(value="/signin/{fb_id}")
	public String signin(@PathVariable String fb_id, Model model,
			Member member, HttpSession session, @RequestParam("url") String url
			) throws Exception {
		
		boolean isLogin = false;
		
		Member member_db = memberService.selectMemberById(fb_id);
		// 로그인 최소 제한 조건...  (직접 주소 치고 오는 것을 방지하기 위해서)
		if(member.getFb_tkn() != null) {
			//최신상태로 회원 정보 업데이트
			memberService.updateMember(member);
			member = memberService.selectMemberById(fb_id);
			
			session.setAttribute("LOGIN_USER", member); //세션에 로그인정보를 넣는다.
			session.setAttribute("LOGIN_STATUS", "LOGIN"); //로그인 상태 (로그인)
			
			isLogin = true; // 에러가 아님
			model.addAttribute("isLogin", isLogin);
			model.addAttribute("locationURL", url); //예전 페이지로 돌아가기.. 흠
		}else {
			throw new ResourceNotFoundException("잘못된 요청 입니다.");
		}
		
		return "common/loginRedirect";
	}
	
	@RequestMapping(value="/signout")
	public String signout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	
}
