package com.yedam.product.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.product.domain.ProductVO;
import com.yedam.product.service.ProductService;
import com.yedam.product.service.ProductServiceImpl;

public class ModifyProductControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ProductService ps = new ProductServiceImpl();
		if(req.getMethod().equals("GET")) {
			String pno = req.getParameter("pno");
			
			ProductVO vo = ps.getProduct(Integer.parseInt(pno));
			req.setAttribute("productInfo", vo);
			
			return "product/productModify.tiles";
			
		}else if(req.getMethod().equals("POST")) {
//			set product_name=#{productName},
//					product_price#{price},
//					product_count=#{productCount}
//				where product_no=#{productNo}
			String pno = req.getParameter("pno");
			String pname = req.getParameter("pname");
			String price = req.getParameter("price");
			String pcount = req.getParameter("pcount");
			
			ProductVO vo = new ProductVO();
			vo.setProductNo(Integer.parseInt(pno));
			vo.setProductName(pname);
			vo.setPrice(Integer.parseInt(price));
			vo.setProductCount(Integer.parseInt(pcount));
			
			if(ps.modifyProduct(vo)) {
				return "product/productList.do";
			} else {
				return "product/modifyProduct.do";
			}
		}
		return null;
	}

}
