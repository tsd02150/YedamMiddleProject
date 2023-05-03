package com.yedam.notice.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.notice.domain.NoticeVO;
import com.yedam.notice.service.NoticeService;
import com.yedam.notice.service.NoticeServiceImpl;

public class GetCustomerControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//customerCenter.jsp 에서 넘어오는 "no"파라미터
		String no= req.getParameter("no");
		System.out.println(no);

		NoticeService service= new NoticeServiceImpl();
		NoticeVO vo = service.getCustomer(Integer.parseInt(no));
		
		req.setAttribute("vo", vo); //getCustomer.jsp로 넘겨주는 파라미터 "vo"
		System.out.println(vo);
		return "notice/getCustomer.tiles";
	}

}
