package tk.tourwith.project.rev.service;

import java.util.List;
import java.util.Map;

import tk.tourwith.project.rev.model.Rev;

public interface RevService {
	
	public List<Rev> selectRevList(Map<String, Object> paramMap) throws Exception;

}
