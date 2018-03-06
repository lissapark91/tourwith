package tk.tourwith.project.crew.room.mapper;

import org.apache.ibatis.annotations.Mapper;

import tk.tourwith.project.crew.room.model.CrewMap;

@Mapper
public interface CrewMapMapper {

	public CrewMap selectMapLoc(String group_maplist);
	
	public CrewMap selectMapLoc4CrewNo(String cr_no);
}
