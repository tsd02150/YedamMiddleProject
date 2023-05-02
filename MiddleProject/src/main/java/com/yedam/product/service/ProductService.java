package com.yedam.product.service;

import java.util.List;

import com.yedam.product.domain.ProductVO;

public interface ProductService {
	public List<ProductVO> prodcutList(int page);
	public ProductVO getProduct(int productNo);
	public int totalCount();

}
