package com.yedam.notice.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.yedam.common.Control;
import com.yedam.notice.domain.NoticeVO;
import com.yedam.notice.service.NoticeService;
import com.yedam.notice.service.NoticeServiceImpl;

public class CustomerAddControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		String id= (String) session.getAttribute("id");

		String saveDir=req.getServletContext().getRealPath("images");
		int maxSize= 5*1024*1024;
		String encoding="UTF-8";
		
		DefaultFileRenamePolicy rn= new DefaultFileRenamePolicy();
		MultipartRequest multi= new MultipartRequest(req, saveDir,maxSize,encoding,rn);
		String title= multi.getParameter("title");
		String content= multi.getParameter("content");
		String attach= multi.getParameter("attach");
		String noticePw= multi.getParameter("noticePw");
		
		NoticeService service = new NoticeServiceImpl();
		NoticeVO vo= new NoticeVO();
		vo.setId(id);
		vo.setNoticeTitle(title);
		vo.setNoticeContent(content);
		vo.setNoticeAttach(attach);
		vo.setNoticePw(noticePw);
		System.out.println(id);
		System.out.println(vo);

		if(service.CustomerAdd(vo)) {
			
			return"customerCenter.do";
		}else {
			return "custmerAddForm.do";
			
		}
	}

}
