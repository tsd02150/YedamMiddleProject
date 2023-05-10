package com.yedam.member.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.member.domain.CompanyVO;
import com.yedam.member.service.CompanyService;
import com.yedam.member.service.CompanyServiceImpl;

public class ConfirmControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		CompanyService service = new CompanyServiceImpl();
		
		String comNo= req.getParameter("comNo");
		System.out.println(comNo);

		if(service.confirm(Integer.parseInt(comNo))){
			return "adminCompany.do";
			
		}else {
			return "confirm.do";
		}
			
	}

}
