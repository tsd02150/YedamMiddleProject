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

public class SearchPriceList implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pageStr = req.getParameter("page");
		pageStr = pageStr == null ? "1" : pageStr;
		int page = Integer.parseInt(pageStr);
		String minPrice = req.getParameter("minPrice");
		String maxPrice = req.getParameter("maxPrice");
		System.out.println(minPrice);
		System.out.println(maxPrice);
		ProductService ps = new ProductServiceImpl();
		int total = ps.totalCount();
		List<BoardVO> searchPrice = ps.searchPrice(Integer.parseInt(minPrice), Integer.parseInt(minPrice), page);
		List<BoardVO> ctgList = ps.ctgJoin();
		System.out.println(searchPrice);
		PageDTO dto = new PageDTO(page, total);
		req.setAttribute("pageInfo", dto);
		req.setAttribute("ctgList", ctgList);
		req.setAttribute("searchPriceList", searchPrice);

		return "product/searchPriceList.tiles";
	}

}
