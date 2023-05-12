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
import com.yedam.product.service.ThemeService;
import com.yedam.product.service.ThemeServiceImpl;

public class ThemeListControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		ProductService service = new ProductServiceImpl();
						
		String pageStr = req.getParameter("page");
		pageStr = pageStr == null ? "1" : pageStr;
		int page = Integer.parseInt(pageStr);
		int total = service.totalCount();
		
		String themeNo= req.getParameter("themeNo");
		ThemeService ts= new ThemeServiceImpl();
		
		PageDTO dto = new PageDTO(page, total);
		req.setAttribute("pageInfo", dto);

		//List<BoardVO> ctgList = service.ctgJoin();
		//req.setAttribute("ctgList", ctgList);
		
		List<BoardVO> boardList = service.boardList(page);
		req.setAttribute("boardList", boardList);
		
		List<ProductVO> productList = service.productList(page);
		req.setAttribute("productList", productList);
		
		ThemeVO vo= new ThemeVO();
		vo.setPage(page);
		vo.setThemeNo(Integer.parseInt(themeNo));
	
		List<ThemeVO> themeList= ts.themeList(vo);
		
		req.setAttribute("themeList", themeList);
		
		
		System.out.println("보드리스트> "+boardList);
		System.out.println("테마리스트> "+themeList);
		
		return "product/themeList.tiles";
			
		
	}

}
