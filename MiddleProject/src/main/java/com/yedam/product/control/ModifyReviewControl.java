package com.yedam.product.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.product.domain.ReviewVO;
import com.yedam.product.service.ProductService;
import com.yedam.product.service.ProductServiceImpl;

public class ModifyReviewControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//content score
		ProductService ps = new ProductServiceImpl();
		
			String bno = req.getParameter("bno");
			
			ReviewVO vo = new ReviewVO();
			vo.setReviewContent(req.getParameter("rcontent"));
			vo.setScore(Integer.parseInt(req.getParameter("score")));
			vo.setReviewAttach(req.getParameter("rattach"));
			vo.setReviewNo(Integer.parseInt("rno"));
			vo.setBoardNo(Integer.parseInt("bno"));
			
			System.out.println("댓글수정vo="+vo);
						
			boolean result = ps.modifyReview(vo);
			String json = "";
			Map<String, Object> map = new HashMap<>();
			
			if(result) {
				vo=ps.gerReview(vo.getReviewNo());
				System.out.println("댓글단건조회=="+vo);
				
				map.put("retCode", "Sucess");
				map.put("data", vo);
			}else {
				map.put("retCode", "Fail");
			}
		Gson gson = new GsonBuilder().create();
		json = gson.toJson(map);
		return json+".json";
	}

}
