package com.yedam.member.mapper;

import java.util.List;

import com.yedam.member.domain.MemberVO;
import com.yedam.product.domain.QnaVO;

public interface MemberMapper {
	public int insertMember(MemberVO vo);
	public int updateMember(MemberVO vo);
	public MemberVO loginCheck(MemberVO vo);
	public MemberVO memberInfo(String id);
	public String searchId(MemberVO vo);
	public String searchPw(MemberVO vo);
	public int updateMemberM(MemberVO vo);
	public List<QnaVO> qnaList(String id);
	public List<QnaVO> qnaWithPage(int page);
	public int getCount();
}
