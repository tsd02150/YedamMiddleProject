package com.yedam.product.mapper;

import java.util.List;

import com.yedam.product.domain.BoardVO;
import com.yedam.product.domain.ProductVO;
import com.yedam.product.domain.ReviewVO;

public interface ProductMapper {
	//상품리스트
	public List<ProductVO> productList();
	//페이징 리스트
	public List<ProductVO> prodWithPage(int page);
	//판매자 상품 조회
	public List<ProductVO> myProductList(int companyNo);
	//상품개별조회
	public ProductVO searchprod(int productNo);
	//상품 등록, 수정, 삭제
	public int insertProduct(ProductVO vo);
	public int updateProduct(ProductVO vo);
	public int deleteProduct(int productNo);
	
	//상품 게시판 페이지
	public List<BoardVO> boardList();
	//게시판 페이징
	public List<BoardVO> boardWithPage(int page);
	//게시판 상세보기
	public BoardVO searchboard(int boardNo);
	//게시판 등록, 수정, 삭제
	public int insertBoard(BoardVO vo);
	public int updateBoard(BoardVO vo);
	public int deleteBoard(int boardNo);
	
	//전체페이지
	public int getCount();
	
	//Review
	public List<ReviewVO> reviewList(int boardNo);
	public ReviewVO searchReview(int reviewNo);
	public int insertReview(ReviewVO vo);
	public int updateReview(ReviewVO vo);
	public int deleteReview(ReviewVO vo);
	

}
