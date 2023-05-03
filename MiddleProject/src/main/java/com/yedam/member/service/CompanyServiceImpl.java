package com.yedam.member.service;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.member.domain.CompanyVO;
import com.yedam.member.mapper.CompanyMapper;

public class CompanyServiceImpl implements CompanyService{
	SqlSession session = DataSource.getInstance().openSession(true);
	CompanyMapper mapper = session.getMapper(CompanyMapper.class);
	@Override
	public boolean addCompany(CompanyVO vo) {
		return mapper.insertCompany(vo)>0;
	}
	
}
