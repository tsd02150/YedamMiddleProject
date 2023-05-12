package com.yedam.member.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.common.PageDTO;
import com.yedam.member.service.MemberService;
import com.yedam.member.service.MemberServiceImpl;

import com.yedam.product.domain.QnaVO;

public class MyQnaListControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		int memberNo = Integer.parseInt(String.valueOf(session.getAttribute("mno")));
		
		String pageStr = req.getParameter("page");
		pageStr = pageStr == null ? "1" : pageStr;
		int page = Integer.parseInt(pageStr);
		
		QnaVO vo = new QnaVO();
		vo.setMemberNo(memberNo);
		vo.setPage(page);
		
		MemberService service = new MemberServiceImpl();
		int total = service.totalCount();
		List<QnaVO>list = service.qnaList(vo);
		
		System.out.println(list);
		PageDTO dto = new PageDTO(page,total);
		
		req.setAttribute("list", list);
		req.setAttribute("pageInfo", dto);
		
		
		
		
		return "member/myQnaList.tiles";
	}

}
