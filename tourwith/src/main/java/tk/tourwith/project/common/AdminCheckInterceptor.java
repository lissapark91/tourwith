package tk.tourwith.project.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import tk.tourwith.project.member.model.Member;

public class AdminCheckInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession(true);
		
		Member member = (Member) session.getAttribute("LOGIN_USER");

		if(session.getAttribute("LOGIN_USER") == null) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return false;
		}
		if(StringUtils.equals(member.getMb_grad(), "M") || StringUtils.equals(member.getMb_grad(), "A")) {
			return true;

		}else {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return false;
			
		}
		
		
	}
	
}
