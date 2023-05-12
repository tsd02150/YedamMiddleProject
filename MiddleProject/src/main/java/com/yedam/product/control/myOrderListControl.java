package com.yedam.product.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.product.domain.BoardVO;
import com.yedam.product.service.ProductService;
import com.yedam.product.service.ProductServiceImpl;

public class myOrderListControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mno = req.getParameter("mno");
		ProductService ps = new ProductServiceImpl();
		String json="[";
		List<BoardVO> list = ps.getOrderList(Integer.parseInt(mno));
		for(int i=0; i<list.size(); i++) {
//		 orderDate   setting   
			json += "{\"orderNo\":"+list.get(i).getOrderNo()+",";
			json += "\"orderDetailNo\":"+list.get(i).getOrderDetailNo()+",";
			json += "\"memberNo\":"+list.get(i).getMemberNo()+",";
			json += "\"deliveryNo\":"+list.get(i).getDeliveryNo()+",";
			json += "\"orderCount\":"+list.get(i).getOrderCount()+",";
			json += "\"productNo\":\""+list.get(i).getProductNo()+"\",";
			json += "\"orderDate\":\""+list.get(i).getOrderDate()+"\",";
			json += "\"setting\":\""+list.get(i).getSetting()+"\"}";
		
			if(i+1 != list.size()) {
				json += ",";
			}
		}
		json +="]";
		return json+".json";
	}
}

