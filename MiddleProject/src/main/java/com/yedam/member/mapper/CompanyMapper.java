package com.yedam.member.mapper;

import java.util.List;

import com.yedam.member.domain.CompanyVO;

public interface CompanyMapper {
	
	
	

	public int insertCompany(CompanyVO vo);
	
	public List<CompanyVO> companyList();
	
	public List<CompanyVO> newCompany();

	public int updateCompany(int companyNo);

	public int delCompany(int companyNo);
}
