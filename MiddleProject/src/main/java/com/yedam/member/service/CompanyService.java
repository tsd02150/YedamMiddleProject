package com.yedam.member.service;

import java.util.List;

import com.yedam.member.domain.CompanyVO;
import com.yedam.member.domain.MemberVO;

public interface CompanyService {
	
	public boolean addCompany(CompanyVO vo);
	
	//public List<CompanyVO> companyList();
	
	//public List<CompanyVO> newCompany();
	
	public boolean confirm(int companyNo);
	
	public boolean delCompany(int companyNo);

	public List<CompanyVO> companyList(int page);

	public int companyCount();

	public List<CompanyVO> newCompany(int page);

	public int newCompanyCount();
	
}
