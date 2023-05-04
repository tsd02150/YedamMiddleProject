package com.yedam.member.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.member.domain.MemberVO;
import com.yedam.member.service.MemberService;
import com.yedam.member.service.MemberServiceImpl;


public class SignInControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getMethod().equals("GET")) {	
			return "member/signInForm.tiles";
		}else if(req.getMethod().equals("POST")) {	
			MemberService service = new MemberServiceImpl();
			String id = req.getParameter("id");
			String pw = req.getParameter("pass");
			MemberVO vo = new MemberVO();
			vo.setId(id);
			vo.setPw(pw);
			vo = service.loginCheck(vo);
			if(vo!=null) {
				HttpSession session = req.getSession();
				
				session.setAttribute("id", vo.getId());
				session.setAttribute("pw", vo.getPw());
				
				return "main.do";
			}else {				
				return "member/signForm.tiles";
			}
		}
		return null;
	}

}
