package com.yedam.product.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.product.domain.ProductVO;
import com.yedam.product.domain.ReviewVO;
import com.yedam.product.service.ProductService;
import com.yedam.product.service.ProductServiceImpl;

public class ReviewListControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String bno = req.getParameter("bno");
		
		ProductService ps = new ProductServiceImpl();
		String json = "[";
		List<ReviewVO> list = ps.reviewList(Integer.parseInt(bno));
		for(int i=0; i<list.size(); i++) {
//			memberNo name, gender, email, 
//			reviewNo, reviewContent, score, 
//			reviewAttach, boardNo reviewDate, 
//			productNo productName, orderNo
			json += "{\"memberNo\":"+list.get(i).getMemberNo()+",";
			json += "\"id\":\""+list.get(i).getId()+"\",";
			json += "\"name\":\""+list.get(i).getName()+"\",";
			json += "\"gender\":\""+list.get(i).getGender()+"\",";
			json += "\"email\":\""+list.get(i).getEmail()+"\",";
			json += "\"reviewNo\":"+list.get(i).getReviewNo()+",";
			json += "\"reviewContent\":\""+list.get(i).getReviewContent()+"\",";
			json += "\"score\":"+list.get(i).getScore()+",";
			json += "\"reviewAttach\":\""+list.get(i).getReviewAttach()+"\",";
			json += "\"reviewDate\":\""+list.get(i).getReviewDate()+"\",";
			json += "\"boardNo\":"+list.get(i).getBoardNo()+",";
			json += "\"productNo\":"+list.get(i).getProductNo()+",";
			json += "\"productName\":\""+list.get(i).getProductName()+"\",";
			json += "\"orderNo\":"+list.get(i).getOrderNo()+"}";
			
			if(i+1 != list.size()) {
				json += ",";
			}
		}
		json +="]";
		return json+".json";
	}
}
