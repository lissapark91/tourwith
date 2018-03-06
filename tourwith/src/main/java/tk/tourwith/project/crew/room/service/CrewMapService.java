package tk.tourwith.project.crew.room.service;

import tk.tourwith.project.crew.room.model.CrewMap;

public interface CrewMapService {

	public CrewMap selectMapLoc(String group_maplist);

	public CrewMap selectMapLoc4CrewNo(String cr_no);
	
}
