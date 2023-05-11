package com.yedam.member.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.member.domain.OrderDetailVO;
import com.yedam.member.service.MemberService;
import com.yedam.member.service.MemberServiceImpl;

public class MyCartControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberService service = new MemberServiceImpl();
		HttpSession session = req.getSession();
		int memberNo = Integer.parseInt(String.valueOf(session.getAttribute("mno")));
		List<OrderDetailVO> myCartList = service.myCart(memberNo);
		System.out.println(memberNo);
		System.out.println(myCartList);
		req.setAttribute("myCartList", myCartList);
		return "member/myCart.tiles";
	}

}
