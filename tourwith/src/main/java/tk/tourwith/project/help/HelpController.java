package tk.tourwith.project.help;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tk.tourwith.project.code.model.Code;
import tk.tourwith.project.code.service.CodeService;
import tk.tourwith.project.help.model.Help;
import tk.tourwith.project.help.service.HelpService;
import tk.tourwith.project.util.PagingUtil;

@Controller
public class HelpController {
	
// SG google api 활용 여행도우미 	
//	인스턴스를 생성
	@Autowired
	HelpService helpService;
	@Autowired
	CodeService codeService;
	
	@RequestMapping(value = "/helper", method = RequestMethod.GET)

		public String helphome(Model model)  {
			
			List<Code> codeList = codeService.selectListByGroupCode("BIG_CATE");
			
			model.addAttribute("codeList",codeList);
			
			return "help/mapList";
	}
	
	
	@RequestMapping(value = "/help/loc", method = RequestMethod.GET)
	@ResponseBody
		public Help helploc(String trplc_no)  {
			
			Help help = helpService.selectLoc(trplc_no);
			
//			model.addAttribute("codeList",help);
			
			return help;
	}
	
	
	
	
	 //COMN_CODE HELP LIST 불러오기 및 페이징, 서치 처리
		@RequestMapping(value = "/admin/codes/help", method = RequestMethod.GET)
		public String selectCodeHelpList(
				@RequestParam(value="searchType", required=false, defaultValue="") String searchType,
				@RequestParam(value="searchWord", required=false, defaultValue="") String searchWord,
				@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
				Model model
				) throws Exception {
			Map<String, Object> paramMap = new HashMap<>();
			
				if(StringUtils.isNotBlank(searchType) && StringUtils.isNotBlank(searchWord)) {
					paramMap.put("searchType", searchType);
					paramMap.put("searchWord", searchWord);				
				}
				
			int count = helpService.codehelpCount(paramMap);
			PagingUtil util = new PagingUtil(currentPage, count);
			
			paramMap.put("startRow", util.getStartRow());
			paramMap.put("pageSize", util.getPageSize());
			
			List<Help> helpList = helpService.selectHelpList(paramMap);
			
			model.addAttribute("helpList", helpList);
			model.addAttribute("pageInfo",util.getPageHtml());
		
			
			return "admin/codeHelpList";
		}
	
	
	
}
