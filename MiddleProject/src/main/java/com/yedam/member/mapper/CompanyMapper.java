package com.yedam.member.mapper;

import java.util.List;

import com.yedam.member.domain.CompanyVO;

public interface CompanyMapper {
		
	public int insertCompany(CompanyVO vo);
	public List<CompanyVO> companyList(int page);
	public List<CompanyVO> newCompany(int page);
	public int updateCompany(int companyNo);
	public int delCompany(int companyNo);
	public int companyCount();
	public int newCompanyCount();
	
}
