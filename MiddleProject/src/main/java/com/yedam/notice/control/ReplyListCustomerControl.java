package com.yedam.notice.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.notice.domain.ReplyVO;
import com.yedam.notice.service.ReplyService;
import com.yedam.notice.service.ReplyServiceImpl;

public class ReplyListCustomerControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String no = req.getParameter("no");
		// json 데이터 생성
		// [{"replyId":5
		// ,"noticeId":98,"reply":"98번댓글",...."replyDate":"2023-05-05"}....]
		ReplyService service = new ReplyServiceImpl();
		String json = "[";
		List<ReplyVO> list = service.replyList(Integer.parseInt(no));
		for (int i = 0; i < list.size(); i++) {
			
			json += "{\"replyNo\":" + list.get(i).getReplyNo() + ",";
			json += "\"replyContent\":\"" + list.get(i).getReplyContent() + "\",";
			json += "\"replyWriter\":\"" + list.get(i).getReplyWriter() + "\"}";
			if (i + 1 != list.size()) {
				json += ",";
			}
		}
		json += "]";
		return json + ".json";
	}

}
