package com.yedam.product.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.product.domain.ReviewVO;
import com.yedam.product.service.ProductService;
import com.yedam.product.service.ProductServiceImpl;

public class ModifyReviewControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ProductService ps = new ProductServiceImpl();
		if(req.getMethod().equals("GET")) {
			String rno = req.getParameter("bno");
			
			ReviewVO vo = ps.gerReview(Integer.parseInt(rno));
			req.setAttribute("reviewInfo", vo);
			
			return "product/reviewModify.tiles";
		} else if(req.getMethod().equals("POST")) {
			String bno = req.getParameter("bno");
			
			ReviewVO vo = new ReviewVO();
			vo.setReviewContent(req.getParameter("rcontent"));
			vo.setScore(Integer.parseInt(req.getParameter("score")));
			vo.setReviewAttach(req.getParameter("rattach"));
			vo.setReviewNo(Integer.parseInt("rno"));
			vo.setBoardNo(Integer.parseInt("bno"));
			
			System.out.println("댓글수정vo="+vo);
			
			boolean result = ps.modifyReview(vo);
			
			if(result) {
				System.out.println("댓글 수정 성공");
				return "product/getBoard.do?bno="+bno;
			}else {
				System.out.println("댓글 수정 실패");
				return "product/getBoard.do?bno="+bno;
			}
			
		}
		return null;
	}

}
