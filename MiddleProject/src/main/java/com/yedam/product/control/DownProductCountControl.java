package com.yedam.product.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.product.domain.ProductVO;
import com.yedam.product.service.ProductService;
import com.yedam.product.service.ProductServiceImpl;

public class DownProductCountControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ProductService service = new ProductServiceImpl();
		int productNo = Integer.parseInt(req.getParameter("productNo"));
		int minusCount = Integer.parseInt(req.getParameter("productCount"));
		ProductVO vo = new ProductVO();
		vo.setProductNo(productNo);
		vo.setProductCount(minusCount);
		String json="";
		if(service.downProductCount(vo)) {
			json+="{\"retcode\":\"Success\"}";
			System.out.println("주문완료");
		}else {
			json+="{\"retcode\":\"Fail\"}";
			System.out.println("주문실패");
		}
		
		return json+".json";
	}

}
