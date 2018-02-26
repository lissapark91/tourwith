package tk.tourwith.project.crew.service;

import java.util.List;
import java.util.Map;

import tk.tourwith.project.crew.model.CrewReply;

public interface CrewReplyService {

	
		//댓글 목록
		public List<CrewReply> crewReplyList(Map<String, Object> paramMap) throws Exception;
		
		//댓글 작성
		public int insertCrewReply(CrewReply crewReply) throws Exception;
		
		//댓글 수정
		public int updateCrewReply(CrewReply crewReply) throws Exception;
		
		//댓글 삭제
		public int deleteCrewReply(String cr_no) throws Exception;
		
		//select CrewReply by cr_rply_no
		public CrewReply selectCrewReplyByPk(String cr_rply_no);
	
}
