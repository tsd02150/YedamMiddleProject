package com.yedam.member.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.common.PageDTO;
import com.yedam.member.domain.MemberVO;
import com.yedam.member.service.MemberService;
import com.yedam.member.service.MemberServiceImpl;

public class AdminMemberControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MemberService service= new MemberServiceImpl();
		
		String pageStr = req.getParameter("page");

		pageStr= pageStr==null ? "1":pageStr;
		int page= Integer.parseInt(pageStr);
		
		List<MemberVO> list = service.memberList(page);
		int total = service.memberCount();
		
		req.setAttribute("list", list);
		
		PageDTO dto = new PageDTO(page, total);
		req.setAttribute("pageInfo", dto);
		
		return "member/memberList.tiles";
	}

}

