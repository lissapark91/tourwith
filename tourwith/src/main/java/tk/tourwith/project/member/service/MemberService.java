package tk.tourwith.project.member.service;

import java.util.List;
import java.util.Map;

import tk.tourwith.project.member.model.Member;

public interface MemberService {

public List<Member> selectMemberList(Map<String, Object> paramMap) throws Exception;
	
	public int insertMember(Member member) throws Exception;

	public int updateMember(Member member) throws Exception;
	
	public Member selectMemberByPK(String mb_no) throws Exception;

	public Member selectMemberById(String fb_id) throws Exception;
	
	public Member selectMemberByNick(String nick) throws Exception;
	
	public int deleteMember(String mb_no) throws Exception;
	
	
	public int updateTourCnt(String mb_no) throws Exception;
	
}
