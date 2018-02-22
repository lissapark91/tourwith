package tk.tourwith.project.member.service;

import java.util.List;
import java.util.Map;

import tk.tourwith.project.member.model.CrAuthor;

public interface CrAuthorService {
	
	public List<CrAuthor> selectListByCrNo(String cr_no);
	
	public int insertCrewLeaderIntoCrAuthor(CrAuthor crAuthor);

	public int insertCrewRequestIntoCrAuthor(CrAuthor crAuthor);

	public int updateRequestApproved(Map<String, Object> paramMap);

	public int updateRequestRefuse(Map<String, Object> paramMap);

	public int updateKickOut1(Map<String, Object> paramMap);

	public int updateKickOut2(Map<String, Object> paramMap);

}
