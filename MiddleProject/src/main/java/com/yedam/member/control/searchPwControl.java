package com.yedam.member.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.member.domain.MemberVO;
import com.yedam.member.service.MemberService;
import com.yedam.member.service.MemberServiceImpl;

public class searchPwControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getMethod().equals("GET")) {
			return "member/searchPwForm.tiles";
		}else if(req.getMethod().equals("POST")) {
			String id = req.getParameter("id");
			String name = req.getParameter("name");
			String rrn = req.getParameter("rrn");
			MemberVO vo = new MemberVO();
			vo.setId(id);
			vo.setName(name);
			vo.setRrn(rrn);
			MemberService service = new MemberServiceImpl();
			String pw = service.searchPw(vo);
			Map<String, String> map = new HashMap<>();
			
			if(pw!=null) {
				map.put("retCode", "Success");
				map.put("pw", pw);
			}else {
				map.put("retCode", "Fail");
			}
			Gson gson = new GsonBuilder().create();
			String json = gson.toJson(map);
			return json+".json";
		}
		return null;
	}

}
