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

//	@Override
//	public List<CompanyVO> companyList() {
//		return mapper.companyList();
//	}

//	@Override
//	public List<CompanyVO> newCompany() {
//		return mapper.newCompany();
//	}

	@Override
	public boolean confirm(int companyNo) {
		return mapper.updateCompany(companyNo) == 1;
	}

	@Override
	public boolean delCompany(int companyNo) {
		return mapper.delCompany(companyNo) == 1;
	}

	@Override
	public List<CompanyVO> companyList(int page) {
		return mapper.companyList(page);
	}

	@Override
	public int companyCount() {
		return mapper.companyCount();
	}

	@Override
	public List<CompanyVO> newCompany(int page) {
		return mapper.newCompany(page);
	}
	
	@Override
	public int newCompanyCount() {
		return mapper.newCompanyCount();
	}
	
	
	
}
