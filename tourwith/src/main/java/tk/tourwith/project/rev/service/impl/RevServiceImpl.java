package tk.tourwith.project.rev.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tk.tourwith.project.rev.mapper.RevMapper;
import tk.tourwith.project.rev.model.Rev;
import tk.tourwith.project.rev.service.RevService;

@Service(value="revService")
public class RevServiceImpl implements RevService{
	
	@Autowired
	RevMapper revMapper;

	@Override
	public List<Rev> selectRevList(Map<String, Object> paramMap) throws Exception {
		
		return revMapper.selectRevList(paramMap);
	}
	
	@Override
	public Rev selectRev(String rev_no) throws Exception{
		
		return revMapper.selectRev(rev_no);
	}

}
