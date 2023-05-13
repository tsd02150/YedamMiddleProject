package com.yedam.member.service;

import java.util.List;

import com.yedam.member.domain.CompanyVO;
import com.yedam.member.domain.MemberVO;

public interface CompanyService {
	
	public List<CompanyVO> companyList(int page);
	public List<CompanyVO> newCompany(int page);
	
	public boolean addCompany(CompanyVO vo);
	public boolean confirm(int companyNo);
	public boolean delCompany(int companyNo);

	public int companyCount();
	public int newCompanyCount();
	
}
