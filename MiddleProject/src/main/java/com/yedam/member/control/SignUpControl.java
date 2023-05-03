package com.yedam.member.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;

public class SignUpControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getMethod().equals("GET")) {
			
			return "member/signInForm.tiles";
		}else if(req.getMethod().equals("POST")) {	
			
			return "common/main.tiles";
		}
		return null;
	}

}
