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

public class HighPriceList implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pageStr = req.getParameter("page");
		pageStr = pageStr == null ? "1" : pageStr;
		int page = Integer.parseInt(pageStr);
		ProductService ps = new ProductServiceImpl();
		int total = ps.totalCount();
		List<BoardVO> boardList = ps.boardList(page);
		List<BoardVO> ctgList = ps.ctgJoin();
		List<BoardVO> highPriceList = ps.highPriceList(page);

		PageDTO dto = new PageDTO(page, total);
		req.setAttribute("boardList", boardList);
		req.setAttribute("ctgList", ctgList);
		req.setAttribute("highPriceList", highPriceList);
		req.setAttribute("pageInfo", dto);

		System.out.println("highPriceList=" + highPriceList);

		return "product/highPriceList.tiles";
	}

}
