package tk.tourwith.project.code.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import tk.tourwith.project.code.model.Code;


@Mapper
public interface CodeMapper {

	
	public List<Code> selectByGroupCode(String group_code) throws Exception;
	
	
	
}
