package com.yedam.member.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.common.PageDTO;
import com.yedam.member.domain.CompanyVO;
import com.yedam.member.service.CompanyService;
import com.yedam.member.service.CompanyServiceImpl;

public class AdminNewCompanyControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		CompanyService service= new CompanyServiceImpl();
		String pageStr = req.getParameter("page");

		pageStr= pageStr==null ? "1":pageStr;
		int page= Integer.parseInt(pageStr);
		
		List<CompanyVO> list = service.newCompany(page);
		int total = service.newCompanyCount();
		
		req.setAttribute("list", list);
		
		PageDTO dto = new PageDTO(page, total);
		req.setAttribute("pageInfo", dto);
		
		return "member/newCompany.tiles";
	}

}


