package com.yedam.member.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.member.domain.MemberVO;
import com.yedam.member.domain.OrdersVO;
import com.yedam.member.service.MemberService;
import com.yedam.member.service.MemberServiceImpl;

public class OrderPageControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		String id = "";
		id = (String)session.getAttribute("id");
		MemberService service = new MemberServiceImpl();
		MemberVO vo = service.memberInfo(id);
		req.setAttribute("memberInfo", vo);		
		
		
		String orderNo = req.getParameter("orderNo");
		
		List<OrdersVO>list = service.orderNoList(orderNo);
		
		System.out.println(orderNo);
		
		req.setAttribute("list", list);
		
		System.out.println("주문"+list);
		
		
		
		return "member/orderPage.tiles";
	}

}
