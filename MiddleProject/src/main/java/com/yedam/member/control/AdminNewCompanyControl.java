package com.yedam.member.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.member.domain.CompanyVO;
import com.yedam.member.service.CompanyService;
import com.yedam.member.service.CompanyServiceImpl;

public class AdminNewCompanyControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		CompanyService service= new CompanyServiceImpl();
		List<CompanyVO> list = service.newCompany();
				
		req.setAttribute("list", list);
		
		
		return "member/newCompany.tiles";
	}

}


