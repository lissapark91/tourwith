package tk.tourwith.project.crew.service;

import java.util.List;
import java.util.Map;

import tk.tourwith.project.crew.model.Crew;

public interface CrewService {

	//크루 목록 조회
	public List<Crew> selectCrewList(Map<String, Object> paramMap) throws Exception;
	
	//크루 조회
	public Crew getCrew(String cr_no) throws Exception;
	
	//크루 등록
	public String insertCrew(Crew crew) throws Exception;
	//크루 수정
	public String updateCrew(Crew crew) throws Exception;
	//크루 삭제
	public String deleteCrew(String cr_no) throws Exception;
}
