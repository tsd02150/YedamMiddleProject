package com.yedam.product.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.product.domain.BoardVO;
import com.yedam.product.domain.ProductVO;
import com.yedam.product.service.ProductService;
import com.yedam.product.service.ProductServiceImpl;

public class getBoardControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO 상품게시판 상세보기

		String bno = req.getParameter("bno");
		String page = req.getParameter("page");
		System.out.println(bno);
		ProductService ps = new ProductServiceImpl();
		BoardVO vo = ps.getBoard(Integer.parseInt(bno));
		
		req.setAttribute("boardInfo", vo);
		req.setAttribute("pageNum", page);
		
		System.out.println("boardInfo : "+vo);
		System.out.println("page : "+page);
		
		return "product/getBoard.tiles";
	}

}
