package com.yedam.notice.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.notice.domain.NoticeVO;
import com.yedam.notice.service.NoticeService;
import com.yedam.notice.service.NoticeServiceImpl;

public class ModifyNotiControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// modifyNoti.jsp에서 post로 넘어오는 방식
		if (req.getMethod().equals("POST")) {

			NoticeService service = new NoticeServiceImpl();
			String no = req.getParameter("no");
			String title = req.getParameter("title");
			String content = req.getParameter("content");

			NoticeVO vo = new NoticeVO();

			vo.setNoticeNo(Integer.parseInt(no));
			vo.setNoticeTitle(title);
			vo.setNoticeContent(content);

			System.out.println("ddd "+vo);
			if (service.modifyNoti(vo)) {

				return "noti.do";

			} else {
				return "main.do";
			}
			

		}
		
		return "main.do";
	}

}
