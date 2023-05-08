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

public class CtgProd implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mctgNo = req.getParameter("mctgNo");
		String sctgNo = req.getParameter("sctgNo");
		ProductService ps = new ProductServiceImpl();
		String json = "[";
		List<ProductVO> list = ps.ctgProd(Integer.parseInt(mctgNo), Integer.parseInt(sctgNo));
		for(int i=0; i<list.size(); i++) {
			json += "{\"subCategoryNo\":"+list.get(i).getSubCategoryNo()+",";
			json += "\"subCategoryName\":\""+list.get(i).getSubCategoryName()+"\",";
			json += "\"mainCategoryNo\":"+list.get(i).getMainCategoryNo()+",";
			json += "\"mainCategoryName\":\""+list.get(i).getMainCategoryName()+"\",";
			json += "\"productNo\":"+list.get(i).getProductNo()+",";
			json += "\"productName\":\""+list.get(i).getProductName()+"\"}";
			
			if(i+1 != list.size()) {
				json += ",";
			}
		}
		json += "]";
		return json+".json";
	}

}
