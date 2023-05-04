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

public class ModifyMemberControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if (req.getMethod().equals("GET")) {
			
			HttpSession session = req.getSession();
			String id = "";
			id = (String)session.getAttribute("id");
			MemberService service = new MemberServiceImpl();
			MemberVO vo = service.memberInfo(id);
			req.setAttribute("memberInfo", vo);
			
			return "member/modifyMember.tiles";
						
		}
		//post방식
		else if (req.getMethod().equals("POST")) {
			
			String id = req.getParameter("id");
			String pw = req.getParameter("pw");
			String phone = req.getParameter("phone");
			String email = req.getParameter("email");
			String adress = req.getParameter("adress");
			MemberVO vo = new MemberVO();
			vo.setId(id);
			vo.setPw(pw);
			vo.setPhone(phone);
			vo.setEmail(email);
			vo.setAdress(adress);
			MemberService service = new MemberServiceImpl();
			System.out.println(vo);
			if(service.updateMemberM(vo)) {
				
				return "myPage.do"; 
			}else {
				return null;
			}
			
			
		}
		
		return null;
		
		
		
		
	}

}
