package com.yedam.product.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.product.domain.BoardVO;
import com.yedam.product.service.ProductService;
import com.yedam.product.service.ProductServiceImpl;

public class AddPayControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ProductService ps = new ProductServiceImpl();
		HttpSession session = req.getSession();
		int mno = Integer.parseInt(String.valueOf(session.getAttribute("mno")));
		String count = req.getParameter("count");
		String pno = req.getParameter("pno");
		String bno = req.getParameter("bno");
		String price = req.getParameter("price");
		BoardVO ovo = ps.searchMyorder(mno);
		System.out.println("ovo:" + ovo);

		BoardVO vo = new BoardVO();
		if(ovo !=null) {
			vo.setOrderNo(ovo.getOrderNo());
		}
		vo.setOrderCount(Integer.parseInt(count));
		vo.setPrice(Integer.parseInt(price));
		vo.setProductNo(Integer.parseInt(pno));
		vo.setMemberNo(mno);

		if (ovo != null) {
			if (ps.addOrderDetail(vo)) {
				System.out.println("구매하기 성공" + vo);
			} else {
				System.out.println("구매하기 실패");
			}
		} else {
			if (ps.addOrder(vo)) {
				System.out.println("구매하기 성공" + vo);
			} else {
				System.out.println("구매하기 실패");
			}
		}
		return "getBoard.do?bno=" + bno;
	}
}
