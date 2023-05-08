package com.yedam.common;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MainControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();

		if (session.getAttribute("checked") != null) {
			if (!session.getAttribute("checked").equals("true")) {
				if (req.getParameter("checked") != null) {
					session.setAttribute("checked", req.getParameter("checked"));
				} else {
					session.setAttribute("checked", "false");
				}
			}
		}

		System.out.println(req.getParameter("close"));
		if (req.getParameter("close") != null) {
			req.setAttribute("close", req.getParameter("close"));
		}
		return "common/main.tiles";
	}

}
