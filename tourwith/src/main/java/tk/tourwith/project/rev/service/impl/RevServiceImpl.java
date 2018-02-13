package tk.tourwith.project.rev.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import tk.tourwith.project.rev.mapper.RevMapper;
import tk.tourwith.project.rev.model.Rev;
import tk.tourwith.project.rev.service.RevService;

@Service(value="revService")
public class RevServiceImpl implements RevService{
	
	RevMapper revMapper;

	@Override
	public List<Rev> selectRevList(Map<String, Object> paramMap) throws Exception {
		
		return revMapper.selectRevList(paramMap);
	}

}
