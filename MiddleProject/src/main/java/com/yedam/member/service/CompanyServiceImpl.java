package com.yedam.member.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.member.domain.CompanyVO;
import com.yedam.member.mapper.CompanyMapper;

public class CompanyServiceImpl implements CompanyService {
	SqlSession session = DataSource.getInstance().openSession(true);
	CompanyMapper mapper = session.getMapper(CompanyMapper.class);

	@Override
	public boolean addCompany(CompanyVO vo) {
		return mapper.insertCompany(vo) > 0;
	}

	@Override
	public List<CompanyVO> companyList(int page) {
		return mapper.companyList(page);
	}

	@Override
	public List<CompanyVO> newCompany(int page) {
		return mapper.newCompany(page);
	}

	@Override
	public boolean confirm(int companyNo) {
		// TODO Auto-generated method stub
		return mapper.updateCompany(companyNo) == 1;
	}

	@Override
	public boolean delCompany(int companyNo) {
		// TODO Auto-generated method stub
		return mapper.delCompany(companyNo) == 1;
	}

	@Override
	public int companyCount() {
		return mapper.companyCount();
	}

	@Override
	public int newCompanyCount() {
		// TODO Auto-generated method stub
		return mapper.newCompanyCount();
	}
}
