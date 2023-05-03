package com.yedam.product.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.product.domain.ReviewVO;
import com.yedam.product.service.ProductService;
import com.yedam.product.service.ProductServiceImpl;

public class RemoveReviewControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String rno = req.getParameter("rno");
		String bno = req.getParameter("bno");
		
		ProductService ps = new ProductServiceImpl();
		ReviewVO vo = new ReviewVO();
		vo.setBoardNo(Integer.parseInt(bno));
		vo.setReviewNo(Integer.parseInt(rno));
		
		boolean result = ps.removeReview(vo);
		
		if(result) {
			System.out.println("댓글 삭제 성공");
			return "product/getBoard.do?bno="+bno;
		}else {
			System.out.println("삭제 실패");
			return "product/getBoard.do?bno="+bno;
		}
	}
}
