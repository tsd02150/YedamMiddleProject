package com.yedam.product.mapper;

import java.util.List;

import com.yedam.product.domain.ProductVO;

public interface ProductMapper {
	//상품리스트
	public List<ProductVO> productList();
	//페이징 리스트
	public List<ProductVO> prodWithPage(int page);
	
	//개별조회
	public ProductVO searchprod(int noticeId);
	//전체페이지
	public int getCount();
	

}
