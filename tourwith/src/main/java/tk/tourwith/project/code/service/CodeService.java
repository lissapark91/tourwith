package tk.tourwith.project.code.service;

import java.util.List;
import java.util.Map;

import tk.tourwith.project.code.model.Code;


public interface CodeService {
//interface는 약속만 한다(규칙)

	public List<Code> selectListByGroupCode(String group_code) ;
//	레코드가 많으면 list 한건이면 map, vo
	
	//지역 불러오기
	public Code selectCodeByPk(String code_no) ;
	
//	어드민페이지 CODE_NM 리스트 불러오기
	public List<Code> selectCodeList(Map<String, Object> paramMap) throws Exception; 	
	
	//페이징
	public int codelistCount(Map<String, Object> paramMap) throws Exception;
	
	//수정
	public int updateCode(Code code) throws Exception;
	
}
