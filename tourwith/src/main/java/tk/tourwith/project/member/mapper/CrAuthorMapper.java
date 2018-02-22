package tk.tourwith.project.member.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import tk.tourwith.project.member.model.CrAuthor;

@Mapper
public interface CrAuthorMapper {
	
	public List<CrAuthor> selectListByCrNo(String cr_no);
	
	public int insertCrewLeaderIntoCrAuthor(CrAuthor crAuthor);

	public int insertCrewRequestIntoCrAuthor(CrAuthor crAuthor);

	public int updateRequestApproved(Map<String, Object> paramMap);

	public int updateRequestRefuse(Map<String, Object> paramMap);

	public int updateKickOut1(Map<String, Object> paramMap);

	public int updateKickOut2(Map<String, Object> paramMap);
	

}
