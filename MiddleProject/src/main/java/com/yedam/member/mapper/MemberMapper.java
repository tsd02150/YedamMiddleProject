package com.yedam.member.mapper;

import com.yedam.member.domain.MemberVO;

public interface MemberMapper {
	public int insertMember(MemberVO vo);
	public int updateMember(MemberVO vo);
	public MemberVO loginCheck(MemberVO vo);
	public MemberVO memberInfo(MemberVO vo);
	public String searchId(MemberVO vo);
	public String searchPw(MemberVO vo);
}
