package tk.tourwith.project.crew.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import tk.tourwith.project.crew.mapper.CrewMapper;
import tk.tourwith.project.crew.model.Crew;
import tk.tourwith.project.crew.service.CrewService;

@Service(value="crewService")
public class CrewServiceImpl implements CrewService{

	CrewMapper crewMapper;
	
	@Override
	public List<Crew> selectCrewList(Map<String, Object> paramMap) throws Exception {
		
		return crewMapper.selectCrewList(paramMap);
	}

}
