package tk.tourwith.project.member.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tk.tourwith.project.member.mapper.CrAuthorMapper;
import tk.tourwith.project.member.model.CrAuthor;
import tk.tourwith.project.member.service.CrAuthorService;
import tk.tourwith.project.util.mapper.NumberCreateMapper;

@Service("crAuthorService")
public class CrAuthorServiceImpl implements CrAuthorService {
	
	@Autowired
	CrAuthorMapper crAuthorMapper;
	@Autowired
	NumberCreateMapper numberCreateMapper;

	@Override
	public List<CrAuthor> selectListByCrNo(String cr_no) {
		return crAuthorMapper.selectListByCrNo(cr_no);
	}

	@Override
	public List<CrAuthor> selectListByMbNo(String mb_no) {
		return crAuthorMapper.selectListByMbNo(mb_no);
	}
	
	@Override
	public CrAuthor selectAuthorByMbNoCrNo(Map<String, Object> paramMap) {
		return crAuthorMapper.selectAuthorByMbNoCrNo(paramMap);
	}

	@Override
	public int insertCrewLeaderIntoCrAuthor(CrAuthor crAuthor) {
		
		int updCnt = crAuthorMapper.insertCrewLeaderIntoCrAuthor(crAuthor);
		
		if(updCnt > 0) {
			numberCreateMapper.updateNumber("CR_AUTHOR");
		}
		
		
		return updCnt;
	}

	@Override
	public int insertCrewRequestIntoCrAuthor(CrAuthor crAuthor) {
		
		int updCnt = crAuthorMapper.insertCrewRequestIntoCrAuthor(crAuthor);
		
		if(updCnt > 0) {
			numberCreateMapper.updateNumber("CR_AUTHOR");
		}
		
		return updCnt;
	}

	@Override
	public int updateRequestApproved(Map<String, Object> paramMap) {
		
		
		return crAuthorMapper.updateRequestApproved(paramMap);
	}
	
	@Override
	public List<CrAuthor> selectListByDe(Map<String, Object> paramMap) {
		
		return crAuthorMapper.selectListByDe(paramMap);
	}

	@Override
	public int updateRequest(Map<String, Object> paramMap) {
		return crAuthorMapper.updateRequest(paramMap);
	}
	
	@Override
	public int updateRequestRefuse(Map<String, Object> paramMap) {
		
		return crAuthorMapper.updateRequestRefuse(paramMap);
	}

	@Override
	public int updateKickOut1(Map<String, Object> paramMap) {
		
		return crAuthorMapper.updateKickOut1(paramMap);
	}

	@Override
	public int updateKickOut2(Map<String, Object> paramMap) {
		
		return crAuthorMapper.updateKickOut2(paramMap);
	}
	
}
