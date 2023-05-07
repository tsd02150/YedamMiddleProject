package com.yedam.member.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.member.domain.CompanyVO;
import com.yedam.member.domain.MemberVO;
import com.yedam.member.service.CompanyService;
import com.yedam.member.service.CompanyServiceImpl;
import com.yedam.member.service.MemberService;
import com.yedam.member.service.MemberServiceImpl;

public class SignUpCompanyControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
			CompanyService cService = new CompanyServiceImpl();
			MemberService mService = new MemberServiceImpl();
			String id = req.getParameter("id");
			String crn=req.getParameter("crn");
			String comName=req.getParameter("comName");
			String comPhone=req.getParameter("comName");
			String comAddr=req.getParameter("comAddr");
			CompanyVO vo = new CompanyVO();
			vo.setCrn(crn);
			vo.setCompanyName(comName);
			vo.setCompanyPhone(comPhone);
			vo.setCompanyAddr(comAddr);
			if(cService.addCompany(vo)) {
				MemberVO memInfo = new MemberVO();
				memInfo.setId(id);
				memInfo.setCrn(crn);
				if(mService.modifyMember(memInfo)) {
					return "main.do";
				}else {
					return null;
				}
			}else {
				return null;
			}			

	}

}
