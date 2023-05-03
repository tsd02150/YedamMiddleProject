package com.yedam.product.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.product.domain.ProductVO;
import com.yedam.product.domain.ReviewVO;
import com.yedam.product.service.ProductService;
import com.yedam.product.service.ProductServiceImpl;

public class ReviewListControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String bno = req.getParameter("bno");
		String pno = req.getParameter("pno");
		
		ProductService ps = new ProductServiceImpl();
		List<ReviewVO> reviewList = ps.reviewList(Integer.parseInt(bno));
	
		List<ProductVO> prodList = ps.prodcutList(Integer.parseInt(pno));
		
		req.setAttribute("reviewList", reviewList);
		req.setAttribute("prodList", prodList);
		
		return null;
	}
}
