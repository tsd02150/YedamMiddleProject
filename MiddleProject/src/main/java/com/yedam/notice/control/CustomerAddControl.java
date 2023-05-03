package com.yedam.notice.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.notice.domain.NoticeVO;
import com.yedam.notice.service.NoticeService;
import com.yedam.notice.service.NoticeServiceImpl;

public class CustomerAddControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String title=req.getParameter("title");
		String content=req.getParameter("content");
		
		
		
		NoticeVO vo= new NoticeVO();
		vo.setNoticeTitle(title);
		vo.setNoticeContent(content);
		
		NoticeService service = new NoticeServiceImpl();

		if(service.CustomerAdd(vo)) {
			return"notice/customerCenter.tiles";
		}else {
			return "notice/custmerAddForm.tiles";
			
		}
	}

}
