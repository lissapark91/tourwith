package tk.tourwith.project.crew.service;

import java.util.List;
import java.util.Map;

import tk.tourwith.project.crew.model.CrewNotice;

public interface CrewNoticeService {
	
	//크루 공지사항 목록 조회
	public List<CrewNotice> selectCrewNoticeList(Map<String, Object> paramMap) throws Exception;
	
	//크루 공지사항 조회
	public CrewNotice selectCrewNotice(String notice_no) throws Exception;
	
	//크루 공지사항 등록
	public int insertCrewNotice(CrewNotice crewNotice) throws Exception;
	
	//크루 공지사항 수정
	public int updateCrew(CrewNotice crewNotice) throws Exception;
	
	//크루 공지사항 삭제
	public int deletCrewNotice(String notice_no) throws Exception;
	
	//페이징 처리
	public int getTotalCnt(Map<String, Object> paramMap) throws Exception;

}
