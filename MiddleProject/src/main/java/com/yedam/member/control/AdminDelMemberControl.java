package com.yedam.member.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.member.service.MemberService;
import com.yedam.member.service.MemberServiceImpl;

public class AdminDelMemberControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MemberService ms = new MemberServiceImpl();
		String memNo= req.getParameter("memNo");
		
		System.out.println(memNo);
		

		boolean result=ms.delMember(Integer.parseInt(memNo));
		System.out.println(result);
		
		if(result){
			
			return "adminMember.do";
		}else {
			
			return "main.do";	
		}
		
			
		
		
		
		
	}

}
