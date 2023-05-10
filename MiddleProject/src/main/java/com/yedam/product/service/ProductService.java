package com.yedam.product.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.notice.domain.ReplyVO;
import com.yedam.product.domain.BoardVO;
import com.yedam.product.domain.MainCategoryVO;
import com.yedam.product.domain.ProductVO;
import com.yedam.product.domain.ReviewVO;
import com.yedam.product.domain.SubCategoryVO;

public interface ProductService {
	//검색기능
	public List<String> searchProductName(String search);
	//product
	public List<ProductVO> productList(int page);
	public ProductVO getProduct(int productNo);
	public List<ProductVO> myProductList(int companyNo);
	public boolean addProduct(ProductVO vo);
	public boolean modifyProduct(ProductVO vo);
	public boolean removeProduct(int productNo);
	public List<MainCategoryVO> ctgMain();
	public List<SubCategoryVO> ctgSub(int mainCategoryNo);
	public List<ProductVO> ctgProd(@Param("mainCategoryNo")int mainCategoryNo, @Param("subCategoryNo")int subCategoryNo);
	public List<BoardVO> ctgJoin();
	//board
	public List<BoardVO> boardList(int page);
	public BoardVO getBoard(int boardNo);
	public List<BoardVO> categoryList(@Param("subCategoryNo") int subCategoryNo, @Param("page") int page);
	public boolean addBoard(BoardVO vo);
	public boolean modifyBoard(BoardVO vo);
	public boolean removeBoard(int boardNo);
	
	public int totalCount();

	//review
	public List<ReviewVO> reviewList(int boardNo);
	public ReviewVO getReview(int reviewNo);
	public boolean addReview(ReviewVO vo);
	public boolean modifyReview(ReviewVO vo);
	public boolean removeReview(ReviewVO vo);
	
	public List<ReviewVO> myOrderList(String id);
	
}
