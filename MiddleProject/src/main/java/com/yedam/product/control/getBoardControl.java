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
		String id = String.valueOf(session.getAttribute("id"));
		System.out.println(id);
		
		String bno = req.getParameter("bno");
		String page = req.getParameter("page");
		System.out.println(bno);
		ProductService ps = new ProductServiceImpl();
		BoardVO vo = ps.getBoard(Integer.parseInt(bno));

		List<QnaVO> qnaList = ps.qnaList(Integer.parseInt(bno));
		List<ReviewVO> reveiwList=ps.reviewList(Integer.parseInt(bno));
		List<BoardVO> orderList = ps.myOrderList(id);

		req.setAttribute("boardInfo", vo);
		req.setAttribute("pageNum", page);
		req.setAttribute("qnaList", qnaList);
		req.setAttribute("reviewList", reveiwList);
		req.setAttribute("orderList", orderList);
		
		System.out.println("boardInfo : "+vo);
		System.out.println("page : "+page);
		System.out.println("qnaList : "+qnaList);
		System.out.println("reveiwList : "+reveiwList);
		System.out.println("orderList : "+orderList);
		
		return "product/getBoard.tiles";
	}

}
