package tk.tourwith.project.crew.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tk.tourwith.project.code.model.Code;
import tk.tourwith.project.code.service.impl.CodeServiceImpl;
import tk.tourwith.project.crew.model.Crew;
import tk.tourwith.project.crew.service.impl.CrewServiceImpl;
import tk.tourwith.project.member.model.Member;
import tk.tourwith.project.member.service.impl.MemberServiceImpl;

@Controller
public class CrewController {

	@Autowired
	CrewServiceImpl crewService;
	@Autowired
	CodeServiceImpl codeService;
	@Autowired
	MemberServiceImpl memberService;

	@RequestMapping("/crew/list/{category}")
	public String getCrewList(@PathVariable String category, Model model) throws Exception {
		
		List<Code> codeList = codeService.selectListByGroupCode("BIG_CATE");
		
		Map<String, Object> paramMap = new HashMap<>();
		// BIG_CATE_{} by.bsp
		paramMap.put("category", String.format("BIG_CATE_%s", category));
		List<Crew> crewList = crewService.selectCrewList(paramMap);
		
		//trplc, 크루 리더, 테마, 모집상태 이름을 넣어준다.
		for(Crew crew : crewList) {
			
			Member member = memberService.selectMemberByPK(crew.getCr_leadr_mb_no());
			crew.setCr_leadr_nick(member.getNick());

			Code code = codeService.selectCodeByPk(crew.getTrplc_no());
			crew.setTrplc_no_nm(code.getCode_nm());
			
			code = codeService.selectCodeByPk(crew.getThema());
			crew.setThema_nm(code.getCode_nm());
			
			code = codeService.selectCodeByPk(crew.getRcrit_sttus());
			crew.setRcrit_sttus_nm(code.getCode_nm());
			
		}
		
		model.addAttribute("codeList",codeList);
		model.addAttribute(crewList);

		return "crew/crewList";
	}

	@RequestMapping("crew/page/{cr_no}")
	public String crewView(Model model, @PathVariable(value = "cr_no", required = true) String cr_no,
			HttpSession session) throws Exception {
		Crew crew = null;

		crew = crewService.getCrew(cr_no);
		
		//로그인유저가 크루 리더이면 수정 삭제를 노출 (로그인이 되어있다는 가정하)
		Member member =  (Member) session.getAttribute("LOGIN_USER");
		if(StringUtils.equals(crew.getCr_leadr_mb_no(), member.getMb_no())) {
			model.addAttribute("isLeader", true);
			
		}
		
		//trplc, 크루 리더, 테마, 모집상태 이름을 넣어준다.
		member = memberService.selectMemberByPK(crew.getCr_leadr_mb_no());
		crew.setCr_leadr_nick(member.getNick());
		crew.setCr_leadr_fb_id(member.getFb_id());

		Code code = codeService.selectCodeByPk(crew.getTrplc_no());
		crew.setTrplc_no_nm(code.getCode_nm());
		
		code = codeService.selectCodeByPk(crew.getThema());
		crew.setThema_nm(code.getCode_nm());
		
		code = codeService.selectCodeByPk(crew.getRcrit_sttus());
		crew.setRcrit_sttus_nm(code.getCode_nm());

		model.addAttribute("crew", crew);

		return "crew/crewView";
	}

	@RequestMapping("crew/form")
	public String crewForm(@RequestParam(value = "cr_no", required = false, defaultValue = "0") String cr_no,
			Model model, HttpSession session) throws Exception {

		Crew crew = null;
		//수정 : 크루 리더인지 확인하고 수정
		if(StringUtils.isNotBlank(cr_no) && StringUtils.isNotEmpty(cr_no)) {
			Member member =  (Member) session.getAttribute("LOGIN_USER");
			crew = crewService.getCrew(cr_no);
			
			//크루리더와 로그인 유저가 같을때
			if(StringUtils.equals(crew.getCr_leadr_mb_no(), member.getMb_no())) {
				

				model.addAttribute("crew", crew);
			}
			//trplc_no뒤에 문자 2개를 짤라서 그룹코드로 넣는다.
			String groupCode = crew.getTrplc_no();
			groupCode = groupCode.substring(0, groupCode.length()-3);
			model.addAttribute("groupCode", groupCode);
			
			//그룹 코드의 그룹코드
			groupCode = groupCode.substring(0, groupCode.length()-3);
			//나라별 선택
			List<Code> bigCateList = codeService.selectListByGroupCode(groupCode);
			
			//테마 선택
			List<Code> themaList = codeService.selectListByGroupCode("THEMA");
			
			model.addAttribute("bigCateList", bigCateList);
			model.addAttribute("themaList", themaList);
		}
		

		return "crew/crewForm";
	}

	@RequestMapping(value = "crew/crewInsert", method = RequestMethod.POST)
	public String insertCrew(Crew crew, Model model) throws Exception {

		int updCnt = crewService.insertCrew(crew);

		return "crew/crewForm";
	}

}
