package tk.tourwith.project.code;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tk.tourwith.project.code.model.Code;
import tk.tourwith.project.code.service.CodeService;
import tk.tourwith.project.member.model.Member;
import tk.tourwith.project.util.PagingUtil;

@Controller
public class CodeController {
	
	@Autowired
	CodeService codeservice;
	
	//admin Home
	
	@RequestMapping(value = "/admin/adminHome", method = RequestMethod.GET)
	public String adminhome()  {
		
		
		
		return "admin/adminHome";
	}

	// COMN_CODE LIST 불러오기 및 페이징, 서치 처리
	@RequestMapping(value = "/admin/codes", method = RequestMethod.GET)
	public String selectCodeList(
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
			
		int count = codeservice.codelistCount(paramMap);
		PagingUtil util = new PagingUtil(currentPage, count);
		
		paramMap.put("startRow", util.getStartRow());
		paramMap.put("pageSize", util.getPageSize());
		
		List<Code> codeList = codeservice.selectCodeList(paramMap);
		
		model.addAttribute("codeList", codeList);
		model.addAttribute("pageInfo",util.getPageHtml());
	
		
		return "admin/codeList";
	}
	
	//수정
	@RequestMapping("admin/codeForm")
	public String updateCode(Code code, HttpSession session, HttpServletRequest request, Model model) throws Exception{
		
		// 로그인 여부 확인
		Member member = (Member) session.getAttribute("LOGIN_USER");
		
		//사용자 정보 세팅
		
		String viewPage = "common/message";
		
		boolean isError = false;
		String message = "정상 수정 되었습니다.";
		
		String locationURL = "/code/" + code.getCode_no();
		
		model.addAttribute("isError", isError);
		model.addAttribute("message", message);
		model.addAttribute("locationURL", locationURL);
		
		return "admin/codeForm";
		
	}

	
	}
	


