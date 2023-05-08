package com.yedam.notice.control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.notice.service.NoticeService;
import com.yedam.notice.service.NoticeServiceImpl;

public class DelCustomerControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String no = req.getParameter("no");
		
		NoticeService service= new NoticeServiceImpl();
		boolean result= service.DelCustomer(Integer.parseInt(no));
		System.out.println(no);

		if(result) {
			return "customerCenter.do";
			
		}else {
			return "main.do";
		}
	}

}
