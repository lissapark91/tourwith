package tk.tourwith.project.help.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tk.tourwith.project.help.mapper.HelpMapper;
import tk.tourwith.project.help.model.Help;
import tk.tourwith.project.help.service.HelpService;


@Service(value="helpService")
public class HelpserviceImpl implements HelpService {
	
	@Autowired
	HelpMapper helpMapper;
	
	@Override
	public Help selectLoc(String group_help) {
		
		return helpMapper.selectLoc(group_help);
	}

}
