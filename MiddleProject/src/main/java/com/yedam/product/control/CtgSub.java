package com.yedam.product.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.product.domain.SubCategoryVO;
import com.yedam.product.service.ProductService;
import com.yedam.product.service.ProductServiceImpl;

public class CtgSub implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mctgNo = req.getParameter("mctgNo"); 
		ProductService ps = new ProductServiceImpl();
		String json="[";
		List<SubCategoryVO> list = ps.ctgSub(Integer.parseInt(mctgNo));
		for(int i=0; i<list.size(); i++) {
			json+="{\"mainCategoryNo\":"+list.get(i).getMainCategoryNo()+",";
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
