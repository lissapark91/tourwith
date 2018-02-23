package tk.tourwith.project.rev.service;

import java.util.List;
import java.util.Map;

import tk.tourwith.project.rev.model.RevReply;

public interface RevReplyService {
	
	// 리뷰 댓글 목록
	public List<RevReply> selectRepList(String rev_rply_no) throws Exception;
	
	// 리뷰 댓글 등록 
	public int insertRep(RevReply rep) throws Exception;
	
	// 리뷰 댓글 수정
	public int updateRep(RevReply rep) throws Exception;
	
	// 리뷰 댓글 삭제
	public int deleteRep(RevReply rep) throws Exception;
	
	// 리뷰 페이징 처리
	public int getTotalCnt(Map<String, Object> paramMap) throws Exception;
}
