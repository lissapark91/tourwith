package tk.tourwith.project.help.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import tk.tourwith.project.help.model.Help;

@Mapper
public interface HelpMapper {

	public Help selectLoc(String group_help);
	
	public List<Help> selectHelpList(Map<String, Object> paramMap) throws Exception;
	
	public int codehelpCount(Map<String, Object> paramMap) throws Exception;
	
}
