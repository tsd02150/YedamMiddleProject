package com.yedam.member.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.member.service.MemberService;
import com.yedam.member.service.MemberServiceImpl;
import com.yedam.product.domain.QnaVO;

public class UpdateQnaControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberService service = new MemberServiceImpl();
		int qnaNo = Integer.parseInt(req.getParameter("qnaNo"));
		String qnaAnswer = req.getParameter("qnaAnswer");
		QnaVO vo = new QnaVO();
		vo.setQnaNo(qnaNo);
		vo.setQnaAnswer(qnaAnswer);
		System.out.println(vo);
		String json = "";
		if(service.updateQna(vo)) {
			json = "{\"retCode\":\"Success\"}";
		}else {
			json = "{\"retCode\":\"Fail\"}";
		}
		
		return json+".json";
	}

}
