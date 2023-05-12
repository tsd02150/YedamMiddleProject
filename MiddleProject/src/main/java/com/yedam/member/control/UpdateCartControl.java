package com.yedam.member.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.member.domain.OrderDetailVO;
import com.yedam.member.service.MemberService;
import com.yedam.member.service.MemberServiceImpl;

public class UpdateCartControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		OrderDetailVO vo = new OrderDetailVO();
		MemberService service = new MemberServiceImpl();
		String json = "";
		for (int i = 0; i < req.getParameterValues("orderDetailNo").length; i++) {
			String orderDetailNo = req.getParameterValues("orderDetailNo")[i];
			String orderCnt = req.getParameterValues("orderCnt")[i];

			System.out.println(orderDetailNo);
			System.out.println(orderCnt);
			vo.setOrderDetailNo(Integer.parseInt(orderDetailNo));
			vo.setOrderCount(Integer.parseInt(orderCnt));
			if (orderCnt.equals("0")) {
				service.deleteCart(Integer.parseInt(orderDetailNo));
			} else {
				if (service.updateCart(vo)) {
					if (!json.equals("{\"retCode\":\"Fail\"}")) {
						json = "{\"retCode\":\"Success\"}";
					}
				} else {
					json = "{\"retCode\":\"Fail\"}";
				}
			}
		}

		return json + ".json";
	}

}
