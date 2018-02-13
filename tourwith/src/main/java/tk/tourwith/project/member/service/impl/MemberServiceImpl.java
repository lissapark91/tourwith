package tk.tourwith.project.member.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tk.tourwith.project.member.mapper.MemberMapper;
import tk.tourwith.project.member.model.Member;
import tk.tourwith.project.member.service.MemberService;

@Service(value="memberService")
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	MemberMapper memberMapper;

	@Override
	public List<Member> selectMemberList(Map<String, Object> paramMap) throws Exception {
		return null;
	}

	@Override
	public int insertMember(Member member) throws Exception {
		return 0;
	}

	@Override
	public Member selectMemberByPK(String mb_no) throws Exception {
		return null;
	}

	@Override
	public Member selectMemberById(String fb_id) throws Exception {		
		
		return memberMapper.selectMemberById(fb_id);
	}

	@Override
	public int deleteMember(String mb_no) throws Exception {
		return 0;
	}

}
