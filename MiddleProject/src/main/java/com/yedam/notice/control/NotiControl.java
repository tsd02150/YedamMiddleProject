package com.yedam.notice.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.common.PageDTO;
import com.yedam.notice.domain.NoticeVO;
import com.yedam.notice.service.NoticeService;
import com.yedam.notice.service.NoticeServiceImpl;

public class NotiControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		NoticeService service = new NoticeServiceImpl();
		String pageStr=req.getParameter("page");
		pageStr = (pageStr==null) ? "1" :pageStr ;
		int page=Integer.parseInt(pageStr) ;
//		int total= service.totalCount();
//		PageDTO dto =new PageDTO(page,);
		
		
		List<NoticeVO> list = service.notiList();
		
		req.setAttribute("list", list);
		
		
		
		return "notice/notiList.tiles";
	}

}
