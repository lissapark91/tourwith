package tk.tourwith.project.crew.service;

import java.util.List;
import java.util.Map;

import tk.tourwith.project.crew.model.Crew;
import tk.tourwith.project.crew.model.CrewReply;

public interface CrewService {

	//크루 목록 조회
	public List<Crew> selectCrewList(Map<String, Object> paramMap) throws Exception;
	
	//크루 조회
	public Crew getCrew(String cr_no) throws Exception;
	
	//크루 등록
	public int insertCrew(Crew crew) throws Exception;
	
	//크루 수정
	public int updateCrew(Crew crew) throws Exception;
	
	//크루 삭제
	public int deleteCrew(String cr_no) throws Exception;
	
	// 페이징 처리 180223 윤종표 추가
	public int getTotalCnt(Map<String, Object> paramMap) throws Exception;
}
