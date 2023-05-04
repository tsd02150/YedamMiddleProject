package com.yedam.member.service;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.member.domain.MemberVO;
import com.yedam.member.mapper.MemberMapper;

public class MemberServiceImpl implements MemberService{
	
	SqlSession session = DataSource.getInstance().openSession(true);
	MemberMapper mapper = session.getMapper(MemberMapper.class);
	@Override
	public boolean addMember(MemberVO vo) {
		return mapper.insertMember(vo)>0;
	}
	@Override
	public boolean modifyMember(MemberVO vo) {
		return mapper.updateMember(vo)>0;
	}
	@Override
	public MemberVO loginCheck(MemberVO vo) {
		return mapper.loginCheck(vo);
	}
	@Override
	public MemberVO memberInfo(String id) {
		return mapper.memberInfo(id);
	}
	@Override
	public String searchId(MemberVO vo) {
		return mapper.searchId(vo);
	}
	@Override
	public String searchPw(MemberVO vo) {
		return mapper.searchPw(vo);
	}
	@Override
	public boolean updateMemberM(MemberVO vo) {
		return mapper.updateMemberM(vo)>0;
	}
	
}
