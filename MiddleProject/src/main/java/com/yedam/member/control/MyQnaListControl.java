package com.yedam.member.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.member.service.MemberService;
import com.yedam.member.service.MemberServiceImpl;
import com.yedam.product.domain.PageDTO;
import com.yedam.product.domain.QnaVO;

public class MyQnaListControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String pageStr = req.getParameter("page");
		pageStr = pageStr == null ? "1" : pageStr;
		int page = Integer.parseInt(pageStr);
		
		MemberService service = new MemberServiceImpl();
		int total = service.totalCount();
		List<QnaVO>list = service.qnaList(page);
		
		PageDTO dto = new PageDTO(page,total);
		req.setAttribute("list", list);
		req.setAttribute("pageInfo", dto);
		
		
		
		
		return "member/qnaList.tiles";
	}

}