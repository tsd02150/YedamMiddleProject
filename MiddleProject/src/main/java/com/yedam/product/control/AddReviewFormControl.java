package com.yedam.product.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.product.domain.BoardVO;
import com.yedam.product.domain.ReviewVO;
import com.yedam.product.service.ProductService;
import com.yedam.product.service.ProductServiceImpl;

public class AddReviewFormControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int boardNo = Integer.parseInt(req.getParameter("boardNo"));
		String boardTitle = req.getParameter("boardTitle");
		
		req.setAttribute("boardNo", boardNo);
		req.setAttribute("boardTitle", boardTitle);
		
		return "product/addReviewForm.tiles";
	}

}
