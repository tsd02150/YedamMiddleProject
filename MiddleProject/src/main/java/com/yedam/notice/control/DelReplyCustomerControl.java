package com.yedam.notice.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.notice.service.ReplyService;
import com.yedam.notice.service.ReplyServiceImpl;

public class DelReplyCustomerControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		String id= (String) session.getAttribute("id");
		
		String rid = req.getParameter("rid");
		ReplyService service = new ReplyServiceImpl();
		String json = "";
		
		
		if (service.delReply(Integer.parseInt(rid))) {
			json = "{\"retCode\":\"Success\"}";
		} else {
			json = "{\"retCode\":\"Fail\"}";
		}
		return json + ".json";
	}

}
