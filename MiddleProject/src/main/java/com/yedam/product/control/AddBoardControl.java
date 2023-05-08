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
		String thumbnail = multi.getFilesystemName("thumbnail");
		String content = multi.getParameter("content");
		String attach = multi.getFilesystemName("attach");
		String pno = multi.getParameter("pno");
		String mno = multi.getParameter("mno");
		
		BoardVO vo = new BoardVO();
		vo.setBoardTitle(title);
		vo.setBoardContent(content);
		vo.setBoardThumbnail(thumbnail);
		vo.setBoardAttach(attach);
		vo.setProductNo(Integer.parseInt(pno));
		vo.setMemberNo(Integer.parseInt(mno));
		
		ProductService ps = new ProductServiceImpl();
		
		if(ps.addBoard(vo)) {
			System.out.println("등록 성공");
			return "boardList.do";
		}else {
			System.out.println("등록 실패");
			return "addBoardForm.do";
		}
		
	}

}
