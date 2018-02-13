package tk.tourwith.project.util.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NumberCreateMapper {
	
	public int updateNumber(String tablenm) throws Exception;

}
