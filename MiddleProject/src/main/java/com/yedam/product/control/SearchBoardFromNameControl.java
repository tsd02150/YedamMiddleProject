package com.yedam.product.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.product.domain.BoardVO;
import com.yedam.product.service.ProductService;
import com.yedam.product.service.ProductServiceImpl;

public class SearchBoardFromNameControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String productName=req.getParameter("productName");
		ProductService service = new ProductServiceImpl();
		BoardVO vo = service.searchBoardFromName(productName);
		System.out.println(vo);
		String json = "{\"boardNo\":"+vo.getBoardNo()+"}";
		return json+".json";
	}

}
