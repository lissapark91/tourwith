package tk.tourwith.project.crew.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tk.tourwith.project.crew.mapper.CrewMapper;
import tk.tourwith.project.crew.model.Crew;
import tk.tourwith.project.crew.service.CrewService;

@Service(value="crewService")
public class CrewServiceImpl implements CrewService{
	
	@Autowired
	CrewMapper crewMapper;
	
	@Override
	public List<Crew> selectCrewList(Map<String, Object> paramMap) throws Exception {
		
		return crewMapper.selectCrewList(paramMap);
	}

	@Override
	public Crew getCrew(String cr_no) throws Exception {
		
		return crewMapper.getCrew(cr_no);
	}

	@Override
	public String insertCrew(Crew crew) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String updateCrew(Crew crew) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String deleteCrew(String cr_no) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
