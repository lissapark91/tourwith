package tk.tourwith.project.crew.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import tk.tourwith.project.crew.model.CrewReply;

@Mapper
public interface CrewReplyMapper {

	
	//댓글 목록
	public List<CrewReply> crewReplyList(Map<String, Object> paramMap) throws Exception;
	
	//댓글 작성
	public int insertCrewReply(CrewReply crewReply) throws Exception;
	
	//댓글 수정
	public int updateCrewReply(CrewReply crewReply) throws Exception;
	
	//댓글 삭제
	public int daleteCrewReply(String cr_no) throws Exception;
	
	//댓글 페이지
	public int getTotalReplyCnt(Map<String, Object> paramMap) throws Exception;
	
}
