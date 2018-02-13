package tk.tourwith.project.member.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import tk.tourwith.project.member.model.Member;

@Mapper
public interface MemberMapper {
	
	public List<Member> selectMemberList(Map<String, Object> paramMap) throws Exception;
	
	public int insertMember(Member member) throws Exception;
	
	public Member selectMemberByPK(String mb_no) throws Exception;

	public Member selectMemberById(String fb_id) throws Exception;
	
	public int deleteMember(String mb_no) throws Exception;
	
}
