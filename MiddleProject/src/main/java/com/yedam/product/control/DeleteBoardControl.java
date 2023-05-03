package com.yedam.product.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.product.service.ProductService;
import com.yedam.product.service.ProductServiceImpl;

public class DeleteBoardControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String bno = req.getParameter("bno");
		
		ProductService ps = new ProductServiceImpl();
		boolean result = ps.removeBoard(Integer.parseInt(bno));
		
		if(result) {
			System.out.println("삭제 성공");
			return "board/boardList.do";
		}else {
			System.out.println("삭제 실패");
			return "board/modifyBoard.do";
		}
		
	}

}
