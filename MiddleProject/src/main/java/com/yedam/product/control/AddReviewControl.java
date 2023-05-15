package com.yedam.product.control;

import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.yedam.common.Control;
import com.yedam.product.domain.ReviewVO;
import com.yedam.product.service.ProductService;
import com.yedam.product.service.ProductServiceImpl;

public class AddReviewControl implements Control {

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
		
		HttpSession session = req.getSession();
		
		int mno = Integer.parseInt(String.valueOf(session.getAttribute("mno")));
		String rcontent = multi.getParameter("rcontent");
		String attach = multi.getFilesystemName("attach");
		String score = multi.getParameter("score");
		String bno = multi.getParameter("bno");
		
		System.out.println(mno);
		System.out.println(rcontent);
		System.out.println(attach);
		System.out.println(score);
		System.out.println(bno);
		
		ProductService ps = new ProductServiceImpl();
		ReviewVO vo = new ReviewVO();
		vo.setMemberNo(mno);
		vo.setReviewContent(rcontent);
		vo.setReviewAttach(attach);
		vo.setScore(Integer.parseInt(score));
		vo.setBoardNo(Integer.parseInt(bno));
		
		System.out.println("리뷰등록==>"+vo);
		
		if(ps.addReview(vo)) {
			System.out.println("리뷰등록 성공");
			return "getBoard.do?bno="+bno;
		}else {
			System.out.println("리뷰등록 실패");
			return "getBoard.do?bno="+bno;
		}
	}
}
