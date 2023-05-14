package com.yedam.member.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.member.domain.MemberVO;
import com.yedam.member.service.MemberService;
import com.yedam.member.service.MemberServiceImpl;
import com.yedam.product.domain.BoardVO;

public class SalesControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		String id = "";
		id = (String)session.getAttribute(id);
		int memberNo = Integer.parseInt(String.valueOf(session.getAttribute("mno")));
		
		
		
		MemberService service = new MemberServiceImpl();
		MemberVO vo = service.memberInfo(id);
		req.setAttribute("memberInfo", vo);
		
		List<BoardVO>list = service.orderProdList(memberNo);
		req.setAttribute("sales", list);
		
		
		
		return "member/sales.tiles";
	}

}
