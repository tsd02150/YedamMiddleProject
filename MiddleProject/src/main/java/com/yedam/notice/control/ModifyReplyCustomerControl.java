package com.yedam.notice.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.notice.domain.ReplyVO;
import com.yedam.notice.service.ReplyService;
import com.yedam.notice.service.ReplyServiceImpl;

public class ModifyReplyCustomerControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ReplyVO vo = new ReplyVO();
		vo.setReplyContent(req.getParameter("reply"));
		vo.setReplyNo(Integer.parseInt(req.getParameter("rid")));

		ReplyService service = new ReplyServiceImpl();
		boolean result = service.modifyReply(vo);

		String json = "";

		Map<String, Object> map = new HashMap<>();
		if (result) {
			// search.
			vo = service.getReply(vo.getReplyNo());

			map.put("retCode", "Success");
			map.put("data", vo);

		} else {
			map.put("retCode", "Fail");
		}

		Gson gson = new GsonBuilder().create(); // gson 객체.
		json = gson.toJson(map);

		return json + ".json";
	}

}
