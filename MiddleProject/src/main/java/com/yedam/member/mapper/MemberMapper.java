package com.yedam.member.mapper;

import com.yedam.member.domain.MemberVO;

public interface MemberMapper {
	public int insertMember(MemberVO vo);
	public int updateMember(MemberVO vo);
	public MemberVO loginCheck(MemberVO vo);
}
