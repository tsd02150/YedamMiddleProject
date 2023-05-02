package com.yedam.product.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.product.domain.PageDTO;
import com.yedam.product.domain.ProductVO;
import com.yedam.product.service.ProductService;
import com.yedam.product.service.ProductServiceImpl;

public class ProductListControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pageStr = req.getParameter("page");
		pageStr = pageStr ==null ? "1" : pageStr;
		int page = Integer.parseInt(pageStr);
		
		ProductService service = new ProductServiceImpl();
		int total = service.totalCount();
		List<ProductVO> list = service.prodcutList(page);
		
		PageDTO dto = new PageDTO(page, total);
		req.setAttribute("prodlist", list);
		req.setAttribute("pageInfo", dto);
		
		return "product/productList.tiles";
	}

}
