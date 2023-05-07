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

public class otherLoginControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberService service = new MemberServiceImpl();
		String id = req.getParameter("id");
		System.out.println(id);
		MemberVO vo = new MemberVO();
		vo = service.memberInfo(id);
		// db에 이번에 접속한 사람의 정보가 없다면 : 첫 접속이면
		if(vo==null) {
			vo = new MemberVO();
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String gender = req.getParameter("gender");
			if(gender.equals("male")||gender.equals("M")) {
				gender="m";
			}else {
				gender="f";
			}
			vo.setId(id);
			vo.setName(name);
			vo.setEmail(email);
			vo.setGender(gender);
			HttpSession session = req.getSession();
			session.setAttribute("memberInfo", vo);
			return "signUpCheck.do";
			
		}else { // 접속한 기록이 있어서 정보를 가지고 있다면
			HttpSession session = req.getSession();
			session.setAttribute("id", vo.getId());
			session.setAttribute("name", vo.getName());
			if(vo.getCompanyNo()!=0) {
				session.setAttribute("companyNo", vo.getCompanyNo());
			}
			return "main.do";
		}

	}

}
