package com.yedam.product.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.product.domain.BoardVO;
import com.yedam.product.domain.MainCategoryVO;
import com.yedam.product.domain.ProductVO;
import com.yedam.product.domain.QnaVO;
import com.yedam.product.domain.ReviewVO;
import com.yedam.product.domain.SubCategoryVO;
import com.yedam.product.domain.ThemeVO;

public interface ProductMapper {
	//상품검색
	public List<String> searchProductName(String search);
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
	public List<MainCategoryVO> ctgMain();
	public List<SubCategoryVO> ctgSub(int mainCategoryNo);
	public List<ProductVO> ctgProd(@Param("mainCategoryNo")int mainCategoryNo, @Param("subCategoryNo")int subCategoryNo);
	public List<BoardVO> ctgJoin();
	
	//상품 게시판 페이지
	public List<BoardVO> boardList();
	//게시판 페이징
	public List<BoardVO> boardWithPage(int page);
	//게시판 상세보기
	public BoardVO searchboard(int boardNo);
	//카테고리별
	public List<BoardVO> categoryList(@Param("subCategoryNo") int subCategoryNo, @Param("page") int page);
	
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
	
	public List<ReviewVO> myOrderList(String id);
	
	//QnA
	public List<QnaVO> qnaList(int boardNo);
	public QnaVO searchQna(int qnaNo);
	public int insertQna(QnaVO vo);
	public int updateQna(QnaVO vo);
	public int deleteQna(QnaVO vo);

	public List<QnaVO> myQnaList(int memberNo);
	
	//테마전
	public List<ThemeVO> selectTheme(int themeNo);
	
	
	
}
