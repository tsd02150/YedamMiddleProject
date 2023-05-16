package com.yedam.member.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.member.service.MemberService;
import com.yedam.member.service.MemberServiceImpl;

public class UpdateDeliControl2 implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String ono = req.getParameter("ono");
		
		MemberService service = new MemberServiceImpl();
		boolean result = service.changeDeli2(Integer.parseInt(ono));
		
		if(result) {
			System.out.println("변경성공");
			return "orderProdList.do";
		} else {
			System.out.println("변경실패");
			return "orderProdList.do";
		}
		
		
	}

}
