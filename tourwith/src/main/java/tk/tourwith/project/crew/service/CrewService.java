package tk.tourwith.project.crew.service;

import java.util.List;
import java.util.Map;

import tk.tourwith.project.crew.model.Crew;

public interface CrewService {

	public List<Crew> selectCrewList(Map<String, Object> paramMap) throws Exception;
	
}
