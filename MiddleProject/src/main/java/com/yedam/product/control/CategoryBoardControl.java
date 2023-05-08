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

public class CategoryBoardControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String sno = req.getParameter("sno");
		ProductService ps = new ProductServiceImpl();
		String json = "[";
		List<BoardVO> list = ps.categoryList(Integer.parseInt(sno));
		for(int i=0; i<list.size(); i++) {
			json += "{\"subCategoryNo\":"+list.get(i).getSubCategoryNo()+",";
			json += "\"subCategoryName\":\""+list.get(i).getSubCategoryName()+"\",";
			json += "\"mainCategoryNo\":"+list.get(i).getMainCategoryNo()+",";
			json += "\"memberNo\":"+list.get(i).getMemberNo()+",";
			json += "\"boardNo\":"+list.get(i).getBoardNo()+",";
			json += "\"productNo\":"+list.get(i).getProductNo()+",";
			json += "\"boardTitle\":\""+list.get(i).getBoardTitle()+"\",";
			json += "\"boardThumbnail\":\""+list.get(i).getBoardThumbnail()+"\",";
			json += "\"boardContent\":\""+list.get(i).getBoardContent()+"\",";
			json += "\"boardAttach\":\""+list.get(i).getBoardAttach()+"\"}";
			
			if(i+1 != list.size()) {
				json+=",";
			}
		}
		json += "]";
		return json+".json";
	}
}
