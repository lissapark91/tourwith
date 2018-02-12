package tk.tourwith.project.crew.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import tk.tourwith.project.crew.model.Crew;

@Mapper
public interface CrewMapper {
	public List<Crew> selectCrewList(Map<String, Object> paramMap) throws Exception;
}
