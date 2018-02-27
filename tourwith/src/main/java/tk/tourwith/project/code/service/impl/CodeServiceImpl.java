package tk.tourwith.project.code.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tk.tourwith.project.code.mapper.CodeMapper;
import tk.tourwith.project.code.model.Code;
import tk.tourwith.project.code.service.CodeService;

@Service(value="codeService") 
public class CodeServiceImpl implements CodeService {

	@Autowired
	CodeMapper codeMapper;

//	코드 부분 나라 불러오기
	@Override
	public List<Code> selectListByGroupCode(String group_code) {

		return codeMapper.selectListByGroupCode(group_code);
	
	}
	
	//bsp 추가 코드 부분 지역 불러오기
	@Override
	public Code selectCodeByPk(String code_no) {
		return codeMapper.selectCodeByPk(code_no);
	}
	
	
	//Code 리스트 보기
	public List<Code> selectCodeList(Map<String, Object> paramMap) throws Exception {
		

		return codeMapper.selectCodeList(paramMap);
		
	}
	
	//조회
	@Override
	public int codelistCount(Map<String, Object> paramMap) throws Exception{
		
		return codeMapper.codelistCount(paramMap);
	}

	//수정
	
	public int updateCode(Code code) throws Exception {
		
		int updCnt = codeMapper.updateCode(code);
		
		return updCnt;
	}

	
}

