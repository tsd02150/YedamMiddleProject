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
		// content score
		ProductService ps = new ProductServiceImpl();
		if (req.getMethod().equals("GET")) {
			String rno = req.getParameter("rno");

			ReviewVO vo = ps.getReview(Integer.parseInt(rno));
//			select * from review
//			join member
//			using(member_no)
//			where review_no=#{reviewNo}
			String json = "";
			Map<String, Object> map = new HashMap<>();
			map.put("boardNo", vo.getBoardNo());
			map.put("reviewNo", vo.getReviewNo());
			map.put("memberNo", vo.getMemberNo());
			map.put("name", vo.getName());
			map.put("reviewContent", vo.getReviewContent());
			map.put("score", vo.getScore());
//			map.put("reviewDate", vo.getReviewDate().getYear() + "-" + vo.getReviewDate().getMonth() + "-" + vo.getReviewDate().getDay());
			map.put("reviewDate", "2023-04-05");
			map.put("reviewAttach", vo.getReviewAttach());

			Gson gson = new GsonBuilder().create();
			json = gson.toJson(map);
			System.out.println(json);
			return json + ".json";

		} else if (req.getMethod().equals("POST")) {

			String bno = req.getParameter("bno");
			String rno = req.getParameter("rno");

			ReviewVO vo = new ReviewVO();
			vo.setReviewContent(req.getParameter("rcontent"));
			vo.setScore(Integer.parseInt(req.getParameter("score")));
//			vo.setReviewAttach(req.getParameter(req.getParameter("rattach")));
			vo.setReviewNo(Integer.parseInt(rno));
//			vo.setBoardNo(Integer.parseInt(req.getParameter(("bno"))));

			System.out.println("댓글수정vo=" + vo);

			boolean result = ps.modifyReview(vo);
			String json = "";
			Map<String, Object> map = new HashMap<>();

			if (result) {
				vo = ps.getReview(vo.getReviewNo());
				System.out.println("댓글단건조회==" + vo);

				map.put("retCode", "Success");
				map.put("data", vo);

			} else {
				map.put("retCode", "Fail");
			}
			Gson gson = new GsonBuilder().create();
			json = gson.toJson(map);
			return json + ".json";
		}
		return null;
	}
}
