package com.yedam.member.service;

import com.yedam.member.domain.MemberVO;

public interface MemberService {
	public boolean addMember(MemberVO vo);
	public boolean modifyMember(MemberVO vo);
	public MemberVO loginCheck(MemberVO vo);
	public MemberVO memberInfo(MemberVO vo);
	
	
}
