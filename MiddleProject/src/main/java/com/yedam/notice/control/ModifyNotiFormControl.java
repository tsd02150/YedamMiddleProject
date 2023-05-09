package com.yedam.notice.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.notice.domain.NoticeVO;
import com.yedam.notice.service.NoticeService;
import com.yedam.notice.service.NoticeServiceImpl;

public class ModifyNotiFormControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//getNoti에서 get으로 넘어왔을때
		NoticeService service=new NoticeServiceImpl();		
		
		String no=req.getParameter("no");
		
		req.setAttribute("vo", service.getNoti(Integer.parseInt(no)));
		
		return "notice/modifyNoti.tiles";
		
	}

}
