package tk.tourwith.project.common;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
@RequestMapping("/common/error")
public class CommonErrorController {
	private static final Logger logger = LoggerFactory.getLogger(CommonErrorController.class);
	
	@RequestMapping(value="/throwable")
	public String throwable(HttpServletRequest request,Model model)
	{
		logger.info("page error throwable");
		pageErrorLog(request);
		model.addAttribute("msg","예외가 발생했습니다.");
		return "common/error";
	}
	
	@RequestMapping(value="/exception")
	public String exception(HttpServletRequest request,Model model)
	{
		logger.info("page error throwable");
		pageErrorLog(request);
		model.addAttribute("msg","예외가 발생했습니다.");
		return "common/error";
	}
	
	@RequestMapping(value="/400")
	public String pageError400(HttpServletRequest request,Model model)
	{
		logger.info("page error code 400");
		pageErrorLog(request);
		model.addAttribute("msg","잘못된 요청입니다.");
		return "common/error";
		
	}
	
	@RequestMapping(value="/404")
	public String pageError404(HttpServletRequest request,Model model)
	{
		logger.info("page error code 404");
		pageErrorLog(request);
		model.addAttribute("msg","요청하신 페이지는 존재하지 않습니다.");
		return "common/error";
		
	}
	
	@RequestMapping(value="/405")
	public String PageError405(HttpServletRequest request,Model model)
	{
		logger.info("page error code 405");
		pageErrorLog(request);
		model.addAttribute("msg","허용되지 않은 메소드입니다.");
		return "common/error";
	}
	
	@RequestMapping(value="/500")
	public String pageError500(HttpServletRequest request,Model model)
	{
		logger.info("page error code 500");
		pageErrorLog(request);
		model.addAttribute("msg","서버에 오류가 발생하였습니다.");
		return "common/error";
		
	}
	
	@RequestMapping(value="/501")
	public String PageError501(HttpServletRequest request,Model model)
	{
		logger.info("page error code 501");
		pageErrorLog(request);
		model.addAttribute("msg","요청 방법이 서버에서 지원되지 않습니다.");
		return "common/error";
	}
	
	
	
	private void pageErrorLog(HttpServletRequest request)
	{
		logger.info("status_code"+request.getAttribute("javax.servlet.error.status_code"));
		logger.info("exception_type"+request.getAttribute("javax.servlet.error.exception_type"));
		logger.info("message"+request.getAttribute("javax.servlet.error.message"));
		logger.info("request_uri"+request.getAttribute("javax.servlet.error.request_uri"));
		logger.info("exception"+request.getAttribute("javax.servlet.error.exception"));
		logger.info("servlet_name"+request.getAttribute("javax.servlet.error.servlet_name"));
		
	}
}
