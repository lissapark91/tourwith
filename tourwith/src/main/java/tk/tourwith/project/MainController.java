package tk.tourwith.project;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import tk.tourwith.project.code.model.Code;
import tk.tourwith.project.code.service.CodeService;
//화면 연결
@Controller
public class MainController {

	@Autowired
//	인스턴스를 생성
	CodeService codeService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
//	컨트롤러랑 jsp랑 연결해주는 애가 @RequestMapping
//	보안 post 필요없음 get 
	public String home(Locale locale, ModelMap model)  {
		
		List<Code> codeList = codeService.selectListByGroupCode("BIG_CATE");
		
		model.addAttribute("codeList",codeList);
		
		
		return "main";
	}
	
	
	@RequestMapping(value="/cate/{groupId}", method = RequestMethod.GET)			
//	이 친구가 {groupId} 경로 변수
	@ResponseBody
	public Map<String,Object> nextCate(@PathVariable String groupId)  {
		
		List<Code> codeList = codeService.selectListByGroupCode(groupId);

		Map<String,Object> model= new HashMap<String, Object>();
		
		model.put("codeList", codeList);
		
		
		return model;
	}

	
//	@RequestMapping(value = "/admin", method = RequestMethod.GET)
//
//	public String adminhome()  {
//		
//		
//		
//		return "admin";
//	}
	
	
	
	
}
