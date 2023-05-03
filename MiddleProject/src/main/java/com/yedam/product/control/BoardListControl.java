package com.yedam.product.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.product.domain.BoardVO;
import com.yedam.product.domain.PageDTO;
import com.yedam.product.domain.ProductVO;
import com.yedam.product.service.ProductService;
import com.yedam.product.service.ProductServiceImpl;

public class BoardListControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String pageStr = req.getParameter("page");
		pageStr = pageStr == null ? "1" : pageStr;
		int page = Integer.parseInt(pageStr);
		
		ProductService ps = new ProductServiceImpl();
		int total = ps.totalCount();
		List<BoardVO> boardList = ps.boardList(page);
		System.out.println(boardList);
		List<ProductVO> productList = ps.prodcutList(page);
		
		PageDTO dto = new PageDTO(page, total);
		req.setAttribute("boardList", boardList);
		req.setAttribute("productList", productList);
		req.setAttribute("pageInfo", dto);
		
		return "product/boardList.tiles";
	}

}
