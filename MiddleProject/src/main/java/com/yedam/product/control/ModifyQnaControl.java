package com.yedam.product.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.product.domain.QnaVO;
import com.yedam.product.service.ProductService;
import com.yedam.product.service.ProductServiceImpl;

public class ModifyQnaControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ProductService ps = new ProductServiceImpl();
		if(req.getMethod().equals("GET")) {
			String qno = req.getParameter("qno");
			
			QnaVO vo = ps.getQna(Integer.parseInt(qno));
			req.setAttribute("MyQna", vo);
			
			return "product/qnaModify.tiles";
			
		} else if(req.getMethod().equals("POST")) {
			HttpSession session = req.getSession();
			int mno = Integer.parseInt(String.valueOf(session.getAttribute("mno")));
			System.out.println("memberNo"+mno);
			
			String bno = req.getParameter("bno");
			String content = req.getParameter("content");
			String qno = req.getParameter("qno");
			String qnaHide = req.getParameter("qnaHide");
			
			QnaVO vo = new QnaVO();
			vo.setQnaContent(content);
			vo.setQnaNo(Integer.parseInt(qno));
			vo.setBoardNo(Integer.parseInt(bno));
			vo.setQnaHide(Integer.parseInt(qnaHide));
			
			if (ps.modifyQna(vo)) {
				System.out.println("수정성공");
				return "getBoard.do?bno="+bno;

			} else {
				System.out.println("수정성공");
				return "getBoard.do?bno="+bno;
			}
			
			
		}
		
		
		return null;
	}

}
;