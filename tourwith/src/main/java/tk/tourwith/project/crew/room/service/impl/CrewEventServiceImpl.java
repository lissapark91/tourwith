package tk.tourwith.project.crew.room.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tk.tourwith.project.crew.room.mapper.CrewEventMapper;
import tk.tourwith.project.crew.room.model.CrewEvent;
import tk.tourwith.project.crew.room.service.CrewEventService;
import tk.tourwith.project.util.mapper.NumberCreateMapper;

@Service(value="crewEventService")
public class CrewEventServiceImpl implements CrewEventService{
	
	@Autowired
	CrewEventMapper crewEventMapper;
	
	@Autowired
	NumberCreateMapper numberCreateMapper;
	
	@Override
	public List<CrewEvent> selectCrewEventList(Map<String, Object> paramMap) throws Exception {

		return crewEventMapper.selectCrewEventList(paramMap);
	}

	@Override
	public CrewEvent getCrewEvent(String event_no) throws Exception {

		return crewEventMapper.getCrewEvent(event_no);
	}

	@Override
	public int insertCrewEvent(CrewEvent crewEvent) throws Exception {
		int updcnt = crewEventMapper.insertCrewEvent(crewEvent);
		if(updcnt >0 )
		{
			numberCreateMapper.updateNumber("CR_EVENT");
		}
		return updcnt;
	}

	@Override
	public int updateCrewEvent(CrewEvent crewEvent) throws Exception {
		return crewEventMapper.updateCrewEvent(crewEvent);
	}

	@Override
	public int deletCrewEvent(String event_no) throws Exception {
		return crewEventMapper.deleteCrewEvent(event_no);
	}

}
