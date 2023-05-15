package com.yedam.product.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.product.domain.BoardVO;
import com.yedam.product.domain.PageDTO;
import com.yedam.product.service.ProductService;
import com.yedam.product.service.ProductServiceImpl;

public class HotDealControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ProductService service = new ProductServiceImpl();
		String pageStr = req.getParameter("page");
		pageStr = pageStr == null ? "1" : pageStr;
		int page = Integer.parseInt(pageStr);
		int total = service.getHotDealCount();
		PageDTO dto = new PageDTO(page, total);
		List<BoardVO> boardList = service.hotDealList(page);
		
		req.setAttribute("pageInfo", dto);
		req.setAttribute("boardList", boardList);
		
		System.out.println(boardList);
		
		return "product/hotdeal.tiles";
	}

}
