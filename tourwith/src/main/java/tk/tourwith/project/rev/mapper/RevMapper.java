package tk.tourwith.project.rev.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import tk.tourwith.project.rev.model.Rev;

@Mapper
public interface RevMapper {
	public List<Rev> selectRevList(Map<String, Object> paramMap) throws Exception;
	
	public int updateHitCnt(String rev_no) throws Exception;
	
	public Rev selectRev(String rev_no) throws Exception;
	
	public int insertRev(Rev rev) throws Exception;
	
	public int updateRev(Rev rev) throws Exception;
	
	public int deleteRev(Rev rev) throws Exception;
	
	public int getTotalCnt(Map<String, Object> paramMap) throws Exception;
}
