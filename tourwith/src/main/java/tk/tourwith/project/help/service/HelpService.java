package tk.tourwith.project.help.service;

import java.util.List;
import java.util.Map;

import tk.tourwith.project.help.model.Help;

public interface HelpService {
	
	public Help selectLoc(String group_help);
	
	public List<Help> selectHelpList(Map<String, Object> paramMap) throws Exception;
	
	public int codehelpCount(Map<String, Object> paramMap) throws Exception;

}
