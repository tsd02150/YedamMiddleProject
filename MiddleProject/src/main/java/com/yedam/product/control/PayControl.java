package com.yedam.product.control;

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

public class PayControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberService service = new MemberServiceImpl();
		HttpSession session = req.getSession();
		int memberNo = Integer.parseInt(String.valueOf(session.getAttribute("mno")));
		List<OrderDetailVO> myCartList = service.myCart(memberNo);
		
		String productName = ((OrderDetailVO)myCartList.get(0)).getProductName();
		if(myCartList.size()>1) {
			productName+=" 외 "+myCartList.size()+"개...";
		}
		req.setAttribute("productName", productName);

		req.setAttribute("myCartList", myCartList);
		
		int price = Integer.parseInt(req.getParameter("totalPrice"));
		req.setAttribute("price", price);
		return "product/pay.tiles";
	}
}
