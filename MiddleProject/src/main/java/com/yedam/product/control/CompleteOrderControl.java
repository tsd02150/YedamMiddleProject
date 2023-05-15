package com.yedam.product.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.product.service.ProductService;
import com.yedam.product.service.ProductServiceImpl;

public class CompleteOrderControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ProductService service = new ProductServiceImpl();
		int orderNo = Integer.parseInt(req.getParameter("orderNo"));
		String json="";
		if(service.completeOrder(orderNo)) {
			json+="{\"retcode\":\"Success\"}";
			System.out.println("주문완료");
		}else {
			json+="{\"retcode\":\"Fail\"}";
			System.out.println("주문실패");
		}
		
		return json+".json";
	}

}
