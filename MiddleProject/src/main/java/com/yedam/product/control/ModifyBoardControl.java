package com.yedam.product.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.product.domain.BoardVO;
import com.yedam.product.service.ProductService;
import com.yedam.product.service.ProductServiceImpl;

public class ModifyBoardControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ProductService ps = new ProductServiceImpl();
		if(req.getMethod().equals("GET")) {
			String bno = req.getParameter("bno");
			
			BoardVO vo = ps.getBoard(Integer.parseInt(bno));
			req.setAttribute("boardInfo", vo);
			System.out.println("boardInfo : "+vo);
			
			return "product/modifyBoard.tiles";
		} else if(req.getMethod().equals("POST")) {
			String bno = req.getParameter("bno");
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			String attach = req.getParameter("attach");
			String thumbnail = req.getParameter("thumbnail");
			
			BoardVO vo = new BoardVO();
			vo.setBoardNo(Integer.parseInt(bno));
			vo.setBoardTitle(title);
			vo.setBoardContent(content);
			vo.setBoardAttach(attach);
			vo.setBoardThumbnail(thumbnail);
			
			if(ps.modifyBoard(vo)) {
				System.out.println("수정 성공");
				return "boardList.do";
			}else {
				System.out.println("수정 실패");
				return "boardList.do";
			}
		}
		return null;
	}

}
