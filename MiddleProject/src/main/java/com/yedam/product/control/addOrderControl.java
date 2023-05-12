package com.yedam.product.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.product.domain.BoardVO;
import com.yedam.product.service.ProductService;
import com.yedam.product.service.ProductServiceImpl;

public class addOrderControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ProductService ps = new ProductServiceImpl();
		HttpSession session = req.getSession();
		int mno = Integer.parseInt(String.valueOf(session.getAttribute("mno")));
		String count = req.getParameter("count");
		// String ono = req.getParameter("ono");
		String pno = req.getParameter("pno");
		String bno = req.getParameter("bno");

		BoardVO ovo = ps.searchMyorder(mno);
		System.out.println("ovo:" + ovo);

		BoardVO vo = new BoardVO();
		if(ovo !=null) {
			vo.setOrderNo(ovo.getOrderNo());
		}
		vo.setOrderCount(Integer.parseInt(count));
		vo.setProductNo(Integer.parseInt(pno));
		vo.setMemberNo(mno);

		if (ovo != null) {
			if (ps.addOrderDetail(vo)) {
				System.out.println("장바구니 담기 성공" + vo);
			} else {
				System.out.println("장바구니 담기 실패");
			}
		} else {
			if (ps.addOrder(vo)) {
				System.out.println("장바구니 담기 성공" + vo);
			} else {
				System.out.println("장바구니 담기 성공" + vo);
			}
		}
		return "getBoard.do?bno=" + bno;
	}
}
