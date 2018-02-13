package tk.tourwith.project.code.service;

import java.util.List;

import tk.tourwith.project.code.model.Code;


public interface CodeService {


	public List<Code> selectByGroupCode(String group_code) throws Exception;
	
	
}
