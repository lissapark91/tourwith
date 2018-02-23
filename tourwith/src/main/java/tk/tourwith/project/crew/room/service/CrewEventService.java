package tk.tourwith.project.crew.room.service;

import java.util.List;
import java.util.Map;

import tk.tourwith.project.crew.room.model.CrewEvent;

public interface CrewEventService {
	
	//크쿠룸 목록 조회
	public List<CrewEvent> selectCrewEventList(Map<String, Object> paramMap) throws Exception;
	
	//크루룸 조회
	public CrewEvent getCrewEvent(String evnet_no) throws Exception;
	
	//크루룸 등록
	public int insertCrewEvent(CrewEvent crewEvent) throws Exception;
	
	//크루룸 수정
	public int updateCrewEvent(CrewEvent crewEvent) throws Exception;
	
	//크루룸 삭제
	public int deletCrewEvent(String event_no) throws Exception;
}
