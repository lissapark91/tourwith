package tk.tourwith.project.rev.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tk.tourwith.project.rev.mapper.RevReplyMapper;
import tk.tourwith.project.rev.model.RevReply;
import tk.tourwith.project.rev.service.RevReplyService;
import tk.tourwith.project.util.mapper.NumberCreateMapper;

@Service("RevReplyService")
public class RevReplyServiceImpl implements RevReplyService{
	
	@Autowired
	RevReplyMapper repMapper;
	
	@Autowired
	NumberCreateMapper numberCreateMapper;
	
	// REVIEW 댓글 조회
	@Override
	public List<RevReply> selectRepList(String rev_rply_no) throws Exception {
		return repMapper.selectRepList(rev_rply_no);
	}
	
	// REVIEW 댓글 입력
	@Override
	public int insertRep(RevReply rep) throws Exception {
		
		int updCnt = repMapper.insertRep(rep);
		
		if(updCnt > 0) {
			numberCreateMapper.updateNumber("REV_RPLY");
		}
		
		return updCnt;
	}

	// REVIEW 댓글 수정
	@Override
	public int updateRep(RevReply rep) throws Exception {
		
		int updCnt = repMapper.updateRep(rep);
		
		return updCnt;
	}

	// REVIEW 댓글 삭제
	@Override
	public int deleteRep(RevReply rep) throws Exception {
		
		int updCnt = repMapper.deleteRep(rep);
		
		return updCnt;
	}
	
	// REVIEW 댓글 페이징 처리
	@Override
	public int getTotalCnt(Map<String, Object> paramMap) throws Exception {
		
		return repMapper.getTotalCnt(paramMap);
	}





	

}
