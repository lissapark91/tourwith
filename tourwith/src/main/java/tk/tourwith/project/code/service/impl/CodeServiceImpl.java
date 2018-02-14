package tk.tourwith.project.code.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tk.tourwith.project.code.mapper.CodeMapper;
import tk.tourwith.project.code.model.Code;
import tk.tourwith.project.code.service.CodeService;

@Service(value="codeService") 
public class CodeServiceImpl implements CodeService {

	@Autowired
	CodeMapper codeMapper;

	@Override
	public List<Code> selectListByGroupCode(String group_code) {

		return codeMapper.selectListByGroupCode(group_code);
	
	}

	


	
}

