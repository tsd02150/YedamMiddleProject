package com.yedam.notice.control;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.notice.domain.NoticeVO;
import com.yedam.notice.service.NoticeService;
import com.yedam.notice.service.NoticeServiceImpl;

public class GetCustomerControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//customerCenter.jsp 에서 넘어오는 "no"파라미터
		String no= req.getParameter("no");
		NoticeService service= new NoticeServiceImpl();
		NoticeVO vo = service.getCustomer(Integer.parseInt(no));
		req.setAttribute("vo", vo); //getCustomer.jsp로 넘겨주는 파라미터 "vo"
		String page =req.getParameter("page");
		req.setAttribute("pageNum",page);
		
		
		if(vo.getNoticeAttach()!=null) {
			String imgPath = req.getServletContext().getRealPath("images");
			Path file =Paths.get(imgPath+"/"+ vo.getNoticeAttach());
			System.out.println(imgPath);
			String filetype= Files.probeContentType(file);
			req.setAttribute("fileType", filetype.substring(0, filetype.indexOf("/")));
		}
			return "notice/getCustomer.tiles";			
			
	}

}
