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

public class AddQnaControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		ProductService service = new ProductServiceImpl();
		String qnaCategory = req.getParameter("qnaCategory");
		String qnaTitle = req.getParameter("qnaTitle");
		String qnaContent = req.getParameter("qnaContent");
		int boardNo = Integer.parseInt(req.getParameter("bno"));
		int memberNo=Integer.parseInt(String.valueOf(session.getAttribute("mno")));
		QnaVO vo = new QnaVO();
		vo.setQnaCategory(qnaCategory);
		vo.setQnaTitle(qnaTitle);
		vo.setQnaContent(qnaContent);
		vo.setBoardNo(boardNo);
		vo.setMemberNo(memberNo);
		
		if(service.addQna(vo)) {
			System.out.println("qna 추가 성공");
			return "getBoard.do?bno="+boardNo;
		}else {
			System.out.println("qna 추가 실패");
			return "getBoard.do?bno="+boardNo;	
		}
	}

}
