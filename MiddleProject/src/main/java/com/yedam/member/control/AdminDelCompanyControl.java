package com.yedam.member.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.member.service.CompanyService;
import com.yedam.member.service.CompanyServiceImpl;

public class AdminDelCompanyControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		CompanyService cs = new CompanyServiceImpl();
		String comNo= req.getParameter("comNo");
		
		
		return null;
	}

}
