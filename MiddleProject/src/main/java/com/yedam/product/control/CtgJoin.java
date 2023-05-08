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

public class CtgJoin implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ProductService ps = new ProductServiceImpl();
		String json="[";
		List<BoardVO> list = ps.ctgJoin();
		for(int i=0; i<list.size(); i++) {
			json+="{\"mainCategoryNo\":"+list.get(i).getMainCategoryNo()+",";
			json+="\"mainCategoryName\":\""+list.get(i).getMainCategoryName()+"\",";
			json+="\"subCategoryNo\":"+list.get(i).getSubCategoryNo()+",";
			json+="\"subCategoryName\":\""+list.get(i).getSubCategoryName()+"\"}";
			
			if(i+1 != list.size()) {
				json+=",";
			}
		}
		json+="]";
		return json+".json";
	}

}
