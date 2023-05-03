package com.yedam.product.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.product.service.ProductService;
import com.yedam.product.service.ProductServiceImpl;

public class DeleteProductControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pno = req.getParameter("pno");
		
		ProductService ps = new ProductServiceImpl();
		boolean result = ps.removeProduct(Integer.parseInt(pno));
		
		if(result) {
			System.out.println("삭제 성공");
			return "product/productList.do";
		}else {
			System.out.println("삭제 실패");
			return "product/modifyProduct.do";
		}
	}
}
