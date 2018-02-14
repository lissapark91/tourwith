package tk.tourwith.project.code.service;

import java.util.List;

import tk.tourwith.project.code.model.Code;


public interface CodeService {
//interface는 약속만 한다(규칙)

	public List<Code> selectListByGroupCode(String group_code) ;
//	레코드가 많으면 list 한건이면 map, vo
	
	
}
