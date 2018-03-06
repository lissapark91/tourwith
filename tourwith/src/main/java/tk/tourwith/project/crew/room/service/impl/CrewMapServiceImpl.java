package tk.tourwith.project.crew.room.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tk.tourwith.project.crew.room.mapper.CrewMapMapper;
import tk.tourwith.project.crew.room.model.CrewMap;
import tk.tourwith.project.crew.room.service.CrewMapService;

@Service(value="crewMapService")
public class CrewMapServiceImpl implements CrewMapService {

	@Autowired
	CrewMapMapper crewMapMapper;
	
	public CrewMap selectMapLoc(String group_maplist) {
		
		return crewMapMapper.selectMapLoc(group_maplist);
	}
	
	@Override
	public CrewMap selectMapLoc4CrewNo(String cr_no) {
		// TODO Auto-generated method stub
		return crewMapMapper.selectMapLoc4CrewNo(cr_no);
	}
	
}
