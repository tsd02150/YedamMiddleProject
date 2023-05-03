package com.yedam.member.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.member.domain.MemberVO;
import com.yedam.member.service.MemberService;
import com.yedam.member.service.MemberServiceImpl;

public class ModifyMemberControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if (req.getMethod().equals("GET")) {

			//String memberId = getSession();
			MemberService service = new MemberServiceImpl();
			
			return "member/memberInfo.tiles";
						
		}
		//post방식
		else if (req.getMethod().equals("POST")) {
			
			
			
		}
		
		return "member/memberInfo.tiles";
		
		
		
		
		
	}

}
