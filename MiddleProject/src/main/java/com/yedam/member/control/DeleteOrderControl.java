package com.yedam.member.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.member.service.MemberService;
import com.yedam.member.service.MemberServiceImpl;

public class DeleteOrderControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String orderNo = req.getParameter("orderNo");
		MemberService service = new MemberServiceImpl();
		
		System.out.println(orderNo);
		
		service.deleteOrder(Integer.parseInt(orderNo));
		
		return "orderList.do";
	}

}





