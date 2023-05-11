package com.yedam.member.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.member.domain.CompanyVO;
import com.yedam.member.domain.MemberVO;
import com.yedam.member.service.MemberService;
import com.yedam.member.service.MemberServiceImpl;

public class MyPageControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		String id = "";
		id = (String)session.getAttribute("id");
		MemberService service = new MemberServiceImpl();
		MemberVO vo = service.memberInfo(id);
		req.setAttribute("memberInfo", vo);
		CompanyVO vo2 = service.companyInfo(id);
		req.setAttribute("companyInfo", vo2);
		
		
		
		return "member/mypageInfo.tiles";
	}

}
