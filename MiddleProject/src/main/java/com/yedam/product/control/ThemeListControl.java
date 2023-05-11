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
import com.yedam.product.domain.ThemeVO;
import com.yedam.product.service.ProductService;
import com.yedam.product.service.ProductServiceImpl;

public class ThemeListControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		ProductService service = new ProductServiceImpl();
		
		String themeNo= req.getParameter("themeNo");
		
		List<ThemeVO> themeList= service.themeList(Integer.parseInt(themeNo));
		
		String pageStr = req.getParameter("page");
		pageStr = pageStr == null ? "1" : pageStr;
		int page = Integer.parseInt(pageStr);
		List<BoardVO> boardList = service.boardList(page);

		int total = service.totalCount();
		List<BoardVO> ctgList = service.ctgJoin();
		List<ProductVO> productList = service.productList(page);
		
		PageDTO dto = new PageDTO(page, total);
		req.setAttribute("boardList", boardList);
		req.setAttribute("productList", productList);
		req.setAttribute("pageInfo", dto);
		
		req.setAttribute("themeList", themeList);
		
		System.out.println(boardList);
		System.out.println(themeList);
		
		return "product/themeList.tiles";
				
	}

}
