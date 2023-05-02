package com.yedam.product.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.product.domain.ProductVO;
import com.yedam.product.mapper.ProductMapper;

public class ProductServiceImpl implements ProductService{
	
	SqlSession session = DataSource.getInstance().openSession(true);
	ProductMapper mapper = session.getMapper(ProductMapper.class);

	@Override
	public List<ProductVO> prodcutList(int page) {
		return mapper.prodWithPage(page);
	}

	@Override
	public ProductVO getProduct(int productNo) {
		return mapper.searchprod(productNo);
	}

	@Override
	public int totalCount() {
		return mapper.getCount();
	}

}
