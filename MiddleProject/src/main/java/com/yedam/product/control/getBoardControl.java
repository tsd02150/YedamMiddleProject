package com.yedam.product.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.product.domain.BoardVO;
import com.yedam.product.domain.QnaVO;
import com.yedam.product.domain.ReviewVO;
import com.yedam.product.service.ProductService;
import com.yedam.product.service.ProductServiceImpl;

public class getBoardControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO 상품게시판 상세보기
		HttpSession session = req.getSession();
		int mno = Integer.parseInt(String.valueOf(session.getAttribute("mno")));
		System.out.println(mno);
		
		String bno = req.getParameter("bno");
		String page = req.getParameter("page");
		System.out.println(bno);
		ProductService ps = new ProductServiceImpl();
		BoardVO vo = ps.getBoard(Integer.parseInt(bno));

		List<QnaVO> list = ps.qnaList(Integer.parseInt(bno));
		List<BoardVO> orderList = ps.getOrderList(mno);

		req.setAttribute("boardInfo", vo);
		req.setAttribute("pageNum", page);
		req.setAttribute("qnaList", list);
		req.setAttribute("orderList", orderList);
		
		System.out.println("boardInfo : "+vo);
		System.out.println("page : "+page);
		System.out.println("qnaList : "+list);
		System.out.println("orderList : "+orderList);
		
		return "product/getBoard.tiles";
	}

}
