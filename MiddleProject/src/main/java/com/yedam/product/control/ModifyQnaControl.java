package com.yedam.product.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.product.domain.QnaVO;
import com.yedam.product.service.ProductService;
import com.yedam.product.service.ProductServiceImpl;

public class ModifyQnaControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ProductService ps = new ProductServiceImpl();
		if(req.getMethod().equals("GET")) {
			String qno = req.getParameter("qno");
			
			QnaVO vo = ps.getQna(Integer.parseInt(qno));
			req.setAttribute("MyQna", vo);
			
			return "product/qnaModify.tiles";
			
		} else if(req.getMethod().equals("POST")) {
			
		}
		
		
		return null;
	}

}
