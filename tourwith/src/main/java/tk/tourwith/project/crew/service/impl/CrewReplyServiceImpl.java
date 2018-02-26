package tk.tourwith.project.crew.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tk.tourwith.project.crew.mapper.CrewReplyMapper;
import tk.tourwith.project.crew.model.CrewReply;
import tk.tourwith.project.crew.service.CrewReplyService;
import tk.tourwith.project.util.mapper.NumberCreateMapper;

@Service(value="crewReplyService")
public class CrewReplyServiceImpl implements CrewReplyService {

	@Autowired
	CrewReplyMapper crewReplyMapper;
	@Autowired
	NumberCreateMapper numberCreateMapper;
	
	
	//댓글 목록
	@Override
	public List<CrewReply> crewReplyList(Map<String, Object> paramMap) throws Exception {
		
		return crewReplyMapper.crewReplyList(paramMap);
	}

	//댓글 작성
	@Override
	public int insertCrewReply(CrewReply crewReply) throws Exception {
		
		int updCnt = crewReplyMapper.insertCrewReply(crewReply);
		if(updCnt > 0) {
			numberCreateMapper.updateNumber("CR_RPLY");
		}
		
		return updCnt;
	}
	
	//댓글 수정
	@Override
	public int updateCrewReply(CrewReply crewReply) throws Exception{
		
		return crewReplyMapper.updateCrewReply(crewReply);
	}
			
	//댓글 삭제
	@Override
	public int deleteCrewReply(String cr_no) throws Exception {
		
		return crewReplyMapper.deleteCrewReply(cr_no);
	}
		
	
	//select CrewReply by cr_rply_no
	public CrewReply selectCrewReplyByPk(String cr_rply_no) {
		return crewReplyMapper.selectCrewReplyByPk(cr_rply_no);
		
	}
	
	
}
