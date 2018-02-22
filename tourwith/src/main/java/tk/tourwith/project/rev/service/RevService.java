package tk.tourwith.project.rev.service;

import java.util.List;
import java.util.Map;

import tk.tourwith.project.rev.model.Rev;

public interface RevService {
	
	// 리뷰 게시글 조회
	public List<Rev> selectRevList(Map<String, Object> paramMap) throws Exception;
	
	// 리뷰 게시글 보기
	public Rev selectRev(String rev_no) throws Exception;
	
	// 리뷰 게시물 등록
	public int insertRev(Rev rev) throws Exception;
	
	// 리뷰 게시물 수정
	public int updateRev(Rev rev) throws Exception;
	
	// 리뷰 게시물 삭제
	public int deleteRev(Rev rev) throws Exception;
	
	//  리뷰 페이징 처리
	public int getTotalCnt(Map<String, Object> paramMap) throws Exception;

}
