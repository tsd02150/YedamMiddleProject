package com.yedam.product.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.product.domain.ProductVO;
import com.yedam.product.service.ProductService;
import com.yedam.product.service.ProductServiceImpl;

public class GetProductControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pno = req.getParameter("pno");
		String page = req.getParameter("page");
		
		ProductService ps = new ProductServiceImpl();
		ProductVO vo = ps.getProduct(Integer.parseInt(pno));
		req.setAttribute("productInfo", vo);
		req.setAttribute("pageNum", page);
		
		return "product/productGet.tiles";
	}

}
