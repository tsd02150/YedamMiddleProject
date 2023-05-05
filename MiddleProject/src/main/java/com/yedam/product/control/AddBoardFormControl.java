package com.yedam.product.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.product.domain.ProductVO;
import com.yedam.product.service.ProductService;
import com.yedam.product.service.ProductServiceImpl;

public class AddBoardFormControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cno = req.getParameter("companyNo");
		ProductService ps = new ProductServiceImpl();
		List<ProductVO> mylist = ps.myProductList(Integer.parseInt(cno));
		
		req.setAttribute("list",mylist);
		
		return "product/addBoardForm.tiles";
	}

}
