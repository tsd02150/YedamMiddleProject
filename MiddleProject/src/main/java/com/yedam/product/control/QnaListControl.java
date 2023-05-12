package com.yedam.product.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.product.domain.QnaVO;
import com.yedam.product.service.ProductService;
import com.yedam.product.service.ProductServiceImpl;

public class QnaListControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String bno = req.getParameter("bno");
		
		ProductService ps = new ProductServiceImpl();
		String json="[";
		List<QnaVO> list = ps.qnaList(Integer.parseInt(bno));
		for(int i=0; i<list.size(); i++) {

			json += "{\"memberNo\":"+list.get(i).getMemberNo()+",";
			json += "\"id\":\""+list.get(i).getId()+"\",";
			json += "\"name\":\""+list.get(i).getName()+"\",";
			json += "\"boardNo\":"+list.get(i).getBoardNo()+",";
			json += "\"productNo\":"+list.get(i).getProductNo()+",";
			json += "\"productName\":\""+list.get(i).getProductName()+"\",";
			json += "\"qnaNo\":"+list.get(i).getQnaNo()+",";
			json += "\"qnaCategory\":\""+list.get(i).getQnaCategory()+"\",";
			json += "\"qnaTitle\":\""+list.get(i).getQnaTitle()+"\",";
			json += "\"qnaContent\":\""+list.get(i).getQnaContent()+"\",";
			json += "\"qnaDate\":\""+list.get(i).getQnaDate()+"\",";
			json += "\"qnaHide\":\""+list.get(i).getQnaHide()+"\",";
			json += "\"qnaAnswer\":\""+list.get(i).getQnaAnswer()+"\"}";
			if(i+1 != list.size()) {
				json += ",";
			}
		}
		json +="]";
		return json+".json";
	}
}
