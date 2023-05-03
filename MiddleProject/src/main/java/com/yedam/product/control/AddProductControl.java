package com.yedam.product.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.product.domain.ProductVO;
import com.yedam.product.service.ProductService;
import com.yedam.product.service.ProductServiceImpl;

public class AddProductControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		 product_name=#{productName}
//			price=#{price}
//			product_count=#{productCount}
//			sub_category_no=#{subCategoryNo}
//			theme_no=#{themeNo}
		String pname = req.getParameter("pname");
		String price = req.getParameter("price");
		String pcount = req.getParameter("pcount");
		String subNo = req.getParameter("subNo");
		String tno = req.getParameter("tno");
		
		ProductVO vo = new ProductVO();
		vo.setProductName(pname);
		vo.setPrice(Integer.parseInt(price));
		vo.setProductCount(Integer.parseInt(pcount));
		vo.setSubCategoryNo(Integer.parseInt(subNo));
		vo.setThemeNo(Integer.parseInt(tno));
		
		
		
		ProductService ps = new ProductServiceImpl();
		System.out.println(vo);
		boolean result = ps.addProduct(vo);
		
		if(result) {
			return "product/productList.do";
		} else {
			return "product/addProduct.do";
		}
	}

}
