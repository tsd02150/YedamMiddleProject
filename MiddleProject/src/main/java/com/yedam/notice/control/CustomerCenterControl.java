package com.yedam.notice.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.notice.domain.NoticeVO;
import com.yedam.notice.service.NoticeService;
import com.yedam.notice.service.NoticeServiceImpl;

public class CustomerCenterControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//customerCenter.jsp에서 넘어오기
		HttpSession session = req.getSession();
		String id= (String) session.getAttribute("id");
		System.out.println(id);

		NoticeService service = new NoticeServiceImpl();
		List<NoticeVO> list = service.CustomerCenter();
		
		req.setAttribute("list", list);
		
		
		return "notice/customerCenter.tiles";
	}

}
