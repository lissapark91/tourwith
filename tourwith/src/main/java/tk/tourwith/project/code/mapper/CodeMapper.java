package tk.tourwith.project.code.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import tk.tourwith.project.code.model.Code;


@Mapper
public interface CodeMapper {
// @Mapper interface 약속할게 mapper.xml에 연결할거야
	
	public List<Code> selectListByGroupCode(String group_code) ;

	public Code selectCodeByPk(String code_no) ;
	
	
	
	
	
	
}
