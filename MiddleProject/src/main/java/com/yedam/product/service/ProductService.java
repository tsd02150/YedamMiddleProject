package com.yedam.product.service;

import java.util.List;

import com.yedam.product.domain.BoardVO;
import com.yedam.product.domain.ProductVO;
import com.yedam.product.domain.ReviewVO;

public interface ProductService {
	//product
	public List<ProductVO> productList(int page);
	public ProductVO getProduct(int productNo);
	public List<ProductVO> myProductList(int companyNo);
	public boolean addProduct(ProductVO vo);
	public boolean modifyProduct(ProductVO vo);
	public boolean removeProduct(int productNo);
	
	//board
	public List<BoardVO> boardList(int page);
	public BoardVO getBoard(int boardNo);
	public boolean addBoard(BoardVO vo);
	public boolean modifyBoard(BoardVO vo);
	public boolean removeBoard(int boardNo);
	
	public int totalCount();

	//review
	public List<ReviewVO> reviewList(int boardNo);
	public ReviewVO gerReview(int reviewNo);
	public boolean addReview(ReviewVO vo);
	public boolean modifyReview(ReviewVO vo);
	public boolean removeReview(ReviewVO vo);
	
}
