package com.yedam.member.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.member.domain.WishVO;
import com.yedam.member.service.MemberService;
import com.yedam.member.service.MemberServiceImpl;
import com.yedam.product.domain.PageDTO;

public class WishListControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		
		String id = "";
		id = (String)session.getAttribute("id");
		
		MemberService service = new MemberServiceImpl();
		List<WishVO>list = service.wishList(id);
		
		req.setAttribute("list", list);
		
		//System.out.println(list);
		
		
		return "member/wishList.tiles";
	}

}
