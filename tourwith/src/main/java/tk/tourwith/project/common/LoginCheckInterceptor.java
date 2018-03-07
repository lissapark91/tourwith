package tk.tourwith.project.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession(true);
		if(session == null) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return false;
		}
		if(session.getAttribute("LOGIN_USER") == null) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return false;
		}
		
		return true;
	}
	
}
