package com.yedam.product.control;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.yedam.common.Control;
import com.yedam.product.domain.BoardVO;
import com.yedam.product.service.ProductService;
import com.yedam.product.service.ProductServiceImpl;

public class AddBoardControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String saveDir = req.getServletContext().getRealPath("images");
		int maxSize = 5*1024*1024;
		String encoding = "UTF-8";
		DefaultFileRenamePolicy rn = new DefaultFileRenamePolicy();
		MultipartRequest multi = new MultipartRequest(req, saveDir, maxSize, encoding, rn);
		
		Enumeration<?> enu = multi.getFileNames();
		while(enu.hasMoreElements()) {
			String file = (String) enu.nextElement();
			System.out.println("file: "+file);
		}
		
		String title = multi.getParameter("title");
		String thumbnail = multi.getParameter("thumbnail");
		String content = multi.getParameter("content");
		String attach = multi.getParameter("attach");
		
		BoardVO vo = new BoardVO();
		vo.setBoardTitle(title);
		vo.setBoardContent(content);
		vo.setBoardThumbnail(thumbnail);
		vo.setBoardAttach(attach);
		
		ProductService ps = new ProductServiceImpl();
		
		if(ps.addBoard(vo)) {
			return "boardList.do";
		}else {
			return "main.do";
		}
		
	}

}
