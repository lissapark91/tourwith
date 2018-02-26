package tk.tourwith.project.crew.room.service;

import java.util.List;
import java.util.Map;

import tk.tourwith.project.crew.room.model.CrewEvent;

public interface CrewEventService {
	
	
	public List<CrewEvent> selectCrewEventList(Map<String, Object> paramMap) throws Exception;
	
	
	public CrewEvent getCrewEvent(String evnet_no) throws Exception;
	
	
	public int insertCrewEvent(CrewEvent crewEvent) throws Exception;
	
	
	public int updateCrewEvent(CrewEvent crewEvent) throws Exception;
	
	
	public int deletCrewEvent(String event_no) throws Exception;
}
