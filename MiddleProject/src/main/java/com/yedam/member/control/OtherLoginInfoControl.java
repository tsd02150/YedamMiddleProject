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

public class OtherLoginInfoControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getMethod().equals("GET")) {
			req.setAttribute("grade", req.getParameter("grade"));
			return "member/otherLoginInfo.tiles";
		}else if(req.getMethod().equals("POST")) {
			MemberService service = new MemberServiceImpl();
			String grade = req.getParameter("grade");
			String addr = req.getParameter("addr");
			String phone = req.getParameter("phone");
			String rrn = req.getParameter("rrn1")+"-"+req.getParameter("rrn2");
			
			MemberVO vo = new MemberVO();
			HttpSession session = req.getSession();
			vo = (MemberVO)session.getAttribute("memberInfo");
			
			vo.setGrade(grade);
			vo.setAdress(addr);
			vo.setPhone(phone);
			vo.setRrn(rrn);
			System.out.println(vo);
			if(service.addMember(vo)) {
				session.removeAttribute("memberInfo");
				if(grade.equals("c")) {		
					return "main.do";				
				}else if(grade.equals("r")) {
					req.setAttribute("id", vo.getId());
					return "member/signUpCompany.tiles";
				}
			}else {
				System.out.println("err");
				return "otherLoginInfo.do";
			}
			
		}
		return null;
	}

}
