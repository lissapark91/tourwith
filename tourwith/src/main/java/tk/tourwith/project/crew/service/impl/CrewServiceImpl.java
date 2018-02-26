package tk.tourwith.project.crew.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tk.tourwith.project.crew.mapper.CrewMapper;
import tk.tourwith.project.crew.model.Crew;
import tk.tourwith.project.crew.model.CrewReply;
import tk.tourwith.project.crew.service.CrewService;
import tk.tourwith.project.member.mapper.CrAuthorMapper;
import tk.tourwith.project.member.model.CrAuthor;
import tk.tourwith.project.util.mapper.NumberCreateMapper;

@Service(value="crewService")
public class CrewServiceImpl implements CrewService{
	
	@Autowired
	CrewMapper crewMapper;
	@Autowired
	NumberCreateMapper numberCreateMapper;
	@Autowired
	CrAuthorMapper crAuthorMapper;
	
	@Override
	public List<Crew> selectCrewList(Map<String, Object> paramMap) throws Exception {
		
		return crewMapper.selectCrewList(paramMap);
	}

	@Override
	public Crew getCrew(String cr_no) throws Exception {
		
		return crewMapper.getCrew(cr_no);
	}

	@Override
	public int insertCrew(Crew crew) throws Exception {
		
		int updCnt = crewMapper.insertCrew(crew);
		
		if(updCnt > 0) {
			
			numberCreateMapper.updateNumber("CREW");
			
			//insert into auth table (leader)
			CrAuthor crAuthor = new CrAuthor();
			crAuthor.setCr_no(crew.getCr_no());
			crAuthor.setMb_no(crew.getCr_leadr_mb_no());
			int updCnt2 = crAuthorMapper.insertCrewLeaderIntoCrAuthor(crAuthor);
			if(updCnt2 > 0) {
				numberCreateMapper.updateNumber("CR_AUTHOR");
			}
			
		}
		
		return updCnt;
		
	}

	@Override
	public int updateCrew(Crew crew) throws Exception {
		
		int updCnt = crewMapper.updateCrew(crew);
		
		return updCnt;
	}

	@Override
	public int deleteCrew(String cr_no) throws Exception {
		// TODO Auto-generated method stub
		return crewMapper.deleteCrew(cr_no);
	}
	

}
