package tk.tourwith.project.help.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import tk.tourwith.project.help.model.Help;

@Mapper
public interface HelpMapper {

	public Help selectLoc(String group_help);
	
}
