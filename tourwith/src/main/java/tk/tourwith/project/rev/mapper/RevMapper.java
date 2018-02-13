package tk.tourwith.project.rev.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import tk.tourwith.project.rev.model.Rev;

@Mapper
public interface RevMapper {
	public List<Rev> selectRevList(Map<String, Object> paramMap) throws Exception;
}
