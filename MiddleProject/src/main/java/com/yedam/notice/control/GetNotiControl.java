package com.yedam.notice.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.notice.domain.NoticeVO;
import com.yedam.notice.service.NoticeService;
import com.yedam.notice.service.NoticeServiceImpl;

public class GetNotiControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String no= req.getParameter("no");
		
		NoticeService service= new NoticeServiceImpl();
		NoticeVO vo = service.getNoti(Integer.parseInt(no));
		req.setAttribute("vo", vo);
		System.out.println(no);
		System.out.println(vo);
		
		return "notice/getNoti.tiles";
	}

}
