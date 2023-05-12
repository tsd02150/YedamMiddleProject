package com.yedam.product.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.product.domain.BoardVO;
import com.yedam.product.service.ProductService;
import com.yedam.product.service.ProductServiceImpl;

public class addOrderDetilControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		ProductService ps = new ProductServiceImpl();
		String count = req.getParameter("count");
		String ono = req.getParameter("ono");
		String pno = req.getParameter("pno");
		String bno = req.getParameter("bno");
		
		BoardVO vo = new BoardVO();
		vo.setBoardNo(Integer.parseInt(bno));
		vo.setOrderCount(Integer.parseInt(count));
		vo.setProductNo(Integer.parseInt(pno));
		vo.setOrderNo(Integer.parseInt(ono));
		
		ps.addOrderDetail(vo);
		
		if(ps.addOrderDetail(vo)) {
			System.out.println("orderDetail 성공"+vo);
			return "getBoard.do?bno="+bno;
		}else {
			System.out.println("orderDetail 실패");
			return "getBoard.do?bno="+bno;
		}
	}
}
