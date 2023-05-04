package com.yedam.notice.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.notice.domain.NoticeVO;
import com.yedam.notice.service.NoticeService;
import com.yedam.notice.service.NoticeServiceImpl;

public class ModifyCustomerControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		NoticeService service = new NoticeServiceImpl();

		//getCustomer에서 수정버튼> modifyCustomer.jsp
		if(req.getMethod().equals("GET")) {
			String no= req.getParameter("no");
			System.out.println(no);
			req.setAttribute("vo", service.getCustomer(Integer.parseInt(no)));
			
			return "notice/modifyCustomer.tiles";
			
		//modifyCustomer에서 수정후 완료버튼> 
		}else if(req.getMethod().equals("POST")){
			
			String no = req.getParameter("no");
			String title=req.getParameter("title");
			String content=req.getParameter("content");
			String attach= req.getParameter("attach");
			
			NoticeVO vo = new NoticeVO();
			
			vo.setNoticeNo(Integer.parseInt(no));
			vo.setNoticeTitle(title);
			vo.setNoticeContent(content);
			vo.setNoticeAttach(attach);
			
			if(service.ModifyCustomer(vo)) {
				return "customerCenter.do";
				
			}else {
				return "modifyCustomer.do";
			}
			
		}
		
		return "main.do";
		
	}

}
