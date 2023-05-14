package com.yedam.product.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.product.domain.QnaVO;
import com.yedam.product.service.ProductService;
import com.yedam.product.service.ProductServiceImpl;

public class RemoveQnaControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String qno = req.getParameter("qno");
		
		ProductService ps = new ProductServiceImpl();
		QnaVO vo = new QnaVO();
		vo.setQnaNo(Integer.parseInt(qno));
		
		boolean result = ps.removeQna(vo);
		String json="";
		Map<String, Object> map = new HashMap<>();
		
		if(result) {
			System.out.println("Qna 삭제 성공");
			map.put("retCode", "Success");
		}else {
			System.out.println("Qna 삭제 실패");
			map.put("retCode", "Fail");
		}
		Gson gson = new GsonBuilder().create();
		json = gson.toJson(map);
		return json+".json";
	}
}
