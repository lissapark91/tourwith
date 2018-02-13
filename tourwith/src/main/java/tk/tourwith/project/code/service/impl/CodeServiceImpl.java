package tk.tourwith.project.code.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tk.tourwith.project.code.mapper.CodeMapper;
import tk.tourwith.project.code.model.Code;
import tk.tourwith.project.code.service.CodeService;

@Service("tk.tourwith.project.code.service.codeService") 
public class CodeServiceImpl implements CodeService {

	@Autowired
	CodeMapper codeMapper;

	@Override
	public List<Code> selectByGroupCode(String group_code) throws Exception {

		return codeMapper.selectByGroupCode(group_code);
	
	}
	
}

