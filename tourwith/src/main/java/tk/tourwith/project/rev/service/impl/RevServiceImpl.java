package tk.tourwith.project.rev.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tk.tourwith.project.rev.mapper.RevMapper;
import tk.tourwith.project.rev.model.Rev;
import tk.tourwith.project.rev.service.RevService;
import tk.tourwith.project.util.mapper.NumberCreateMapper;

@Service(value="revService")
public class RevServiceImpl implements RevService{
	
	@Autowired
	RevMapper revMapper;
	
	@Autowired
	NumberCreateMapper numberCreateMapper;
	
	// REVIEW 게시글 조회
	@Override
	public List<Rev> selectRevList(Map<String, Object> paramMap) throws Exception {
		
		return revMapper.selectRevList(paramMap);
	}
	
	
	
	@Override
	public Rev selectRev(String rev_no) throws Exception{
		
		revMapper.updateHitCnt(rev_no);
		
		Rev rev = revMapper.selectRev(rev_no);
		
		return rev;
	}

	// REVIEW 게시글 작성 
	@Override
	public int insertRev(Rev rev) throws Exception {
		
		int updCnt = revMapper.insertRev(rev);
		
		if(updCnt > 0){
			numberCreateMapper.updateNumber("REV");
		}
		
		return updCnt;
	}

	// REVIEW 게시물 수정
	@Override
	public int updateRev(Rev rev) throws Exception {
		
		int updCnt = revMapper.updateRev(rev);
		
		return updCnt;
	}

	// REVIEW 게시물 삭제
	@Override
	public int deleteRev(Rev rev) throws Exception {
		
		int updCnt = revMapper.deleteRev(rev);
		
		return updCnt;
	}

	// 페이징 조회를 위한
	@Override
	public int getTotalCnt(Map<String, Object> paramMap) throws Exception {
		
		return revMapper.getTotalCnt(paramMap);
	}

}
