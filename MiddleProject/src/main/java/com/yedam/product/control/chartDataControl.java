package com.yedam.product.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.product.domain.ProductVO;
import com.yedam.product.service.ProductService;
import com.yedam.product.service.ProductServiceImpl;

public class chartDataControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pno = req.getParameter("pno");

		ProductService ps = new ProductServiceImpl();
		String json = "[";
		List<ProductVO> list = ps.chartDataList(Integer.parseInt(pno));
		for (int i = 0; i < list.size(); i++) {

			json += "{\"gender\":\"" + list.get(i).getGender() + "\",";
			json += "\"orderCount\":" + list.get(i).getOrderCount() + "}";

			if (i + 1 != list.size()) {
				json += ",";
			}
		}
		json += "]";
		return json + ".json";
	}
}
