package com.yedam.product.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.product.domain.BoardVO;
import com.yedam.product.domain.MainCategoryVO;
import com.yedam.product.domain.ProductVO;
import com.yedam.product.domain.ReviewVO;
import com.yedam.product.domain.SubCategoryVO;
import com.yedam.product.mapper.ProductMapper;

public class ProductServiceImpl implements ProductService{
	
	SqlSession session = DataSource.getInstance().openSession(true);
	ProductMapper mapper = session.getMapper(ProductMapper.class);

	@Override
	public List<String> searchProductName(String search) {
		return mapper.searchProductName(search);
	}

	@Override
	public List<ProductVO> productList(int page) {
		return mapper.prodWithPage(page);
	}

	@Override
	public ProductVO getProduct(int productNo) {
		return mapper.searchprod(productNo);
	}
	@Override
	public boolean addProduct(ProductVO vo) {
		return mapper.insertProduct(vo)==1;
	}
	
	public boolean modifyProduct(ProductVO vo) {
		return mapper.updateProduct(vo)==1;
	}
	
	@Override
	public boolean removeProduct(int productNo) {
		return mapper.deleteProduct(productNo)==1;
	}

	@Override
	public int totalCount() {
		return mapper.getCount();
	}

	@Override
	public List<BoardVO> boardList(int page) {
		// TODO Auto-generated method stub
		return mapper.boardWithPage(page);
	}

	@Override
	public BoardVO getBoard(int boardNo) {
		return mapper.searchboard(boardNo);
	}

	@Override
	public boolean addBoard(BoardVO vo) {
		return mapper.insertBoard(vo)==1;
	}

	@Override
	public boolean modifyBoard(BoardVO vo) {
		return mapper.updateBoard(vo)==1;
	}

	@Override
	public boolean removeBoard(int boardNo) {
		return mapper.deleteBoard(boardNo)==1;
	}

	@Override
	public List<ReviewVO> reviewList(int boardNo) {
		return mapper.reviewList(boardNo);
	}

	@Override
	public ReviewVO getReview(int reviewNo) {
		return mapper.searchReview(reviewNo);
	}

	@Override
	public boolean addReview(ReviewVO vo) {
		return mapper.insertReview(vo)==1;
	}

	@Override
	public boolean modifyReview(ReviewVO vo) {
		return mapper.updateReview(vo)==1;
	}

	@Override
	public boolean removeReview(ReviewVO vo) {
		return mapper.deleteReview(vo)==1;
	}

	@Override
	public List<ProductVO> myProductList(int companyNo) {
		return mapper.myProductList(companyNo);
	}

	@Override
	public List<MainCategoryVO> ctgMain() {
		return mapper.ctgMain();
	}

	@Override
	public List<SubCategoryVO> ctgSub(int mainCategoryNo) {
		return mapper.ctgSub(mainCategoryNo);
	}

	@Override
	public List<ProductVO> ctgProd(@Param("mainCategoryNo") int mainCategoryNo, @Param("subCategoryNo")int subCategoryNo) {
		return mapper.ctgProd(mainCategoryNo, subCategoryNo);
	}



	@Override
	public List<BoardVO> ctgJoin() {
		return mapper.ctgJoin();
	}

	@Override
	public List<BoardVO> categoryList(@Param("subCategoryNo") int subCategoryNo, @Param("page") int page) {
		return mapper.categoryList(subCategoryNo, page);
	}

	@Override
	public List<ReviewVO> myOrderList(String id) {
		return mapper.myOrderList(id);
	}




}
