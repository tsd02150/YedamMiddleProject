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
import com.yedam.product.domain.PageDTO;

public class OrderDeliListControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		String pageStr = req.getParameter("page");
		pageStr = pageStr == null ? "1" : pageStr;
		int page = Integer.parseInt(pageStr);
		
		String id = "";
		id = (String)session.getAttribute("id");
		
		int memberNo = Integer.parseInt(String.valueOf(session.getAttribute("mno")));
		
		
		MemberService service = new MemberServiceImpl();
		int total = service.totalCount();
		PageDTO dto = new PageDTO(page,total);
		req.setAttribute("pageInfo", dto);
		
		MemberVO vo = service.memberInfo(id);
		req.setAttribute("memberInfo", vo);
		
		System.out.println(memberNo);
		
		List<BoardVO>list = service.orderProdList(memberNo);
		req.setAttribute("orderProdList", list);
		
		System.out.println(list);
	
		
		
		
		return "member/orderDeliList.tiles";
	}

}
