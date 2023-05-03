package com.yedam.member.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.member.domain.MemberVO;
import com.yedam.member.service.MemberService;
import com.yedam.member.service.MemberServiceImpl;

public class SignUpControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getMethod().equals("GET")) {
			req.setAttribute("grade", req.getParameter("grade"));
			return "member/signUpForm.tiles";
		}else if(req.getMethod().equals("POST")) {	
			MemberService service = new MemberServiceImpl();
			String grade = req.getParameter("grade");
			String id = req.getParameter("id");
			String pass = req.getParameter("pass");
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String addr = req.getParameter("addr");
			String phone = req.getParameter("phone");
			String rrn = req.getParameter("rrn1")+"-"+req.getParameter("rrn2");
			String gender="";
			if(req.getParameter("rrn2").substring(0, 1).equals("1")||req.getParameter("rrn2").substring(0, 1).equals("3")){
				gender = "m";
			}else if(req.getParameter("rrn2").substring(0, 1).equals("2")||req.getParameter("rrn2").substring(0, 1).equals("4")) {
				gender = "f";
			}
			MemberVO vo = new MemberVO();
			vo.setGrade(grade);
			vo.setId(id);
			vo.setPw(pass);
			vo.setName(name);
			vo.setEmail(email);
			vo.setAdress(addr);
			vo.setPhone(phone);
			vo.setRrn(rrn);
			vo.setGender(gender);
			System.out.println(vo);
			if(service.addMember(vo)) {
				if(grade.equals("c")) {		
					return "main.do";				
				}else if(grade.equals("r")) {
					req.setAttribute("id", id);
					return "signUpCompany.do";
				}
			}else {
				System.out.println("err");
				return "signUp.do";
			}
		}
		return null;
	}

}
