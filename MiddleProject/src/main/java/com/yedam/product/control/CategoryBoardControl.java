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

public class CategoryBoardControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pageStr = req.getParameter("page");
		pageStr = pageStr == null ? "1" : pageStr;
		int page = Integer.parseInt(pageStr);
		int sno = Integer.parseInt(req.getParameter("sno"));
		System.out.println(page);
		System.out.println(sno);
		ProductService ps = new ProductServiceImpl();
		int total = ps.categoryListCount(sno);
		List<BoardVO> ctgrlist = ps.categoryList(sno, page);
		List<BoardVO> boardList = ps.boardList(page);
		List<BoardVO> ctgList = ps.ctgJoin();
		PageDTO dto = new PageDTO(page,total);
		req.setAttribute("ctgrlist", ctgrlist);
		req.setAttribute("boardList", boardList);
		req.setAttribute("pageInfo", dto);
		req.setAttribute("ctgList", ctgList);
		
		System.out.println("==>ctgrlist : "+ctgrlist);
		System.out.println("boardList : "+boardList);
		
		return "product/categoryBoardList.tiles";
	}
}
