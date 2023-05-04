package com.yedam.product.domain;

import lombok.Data;

@Data
public class BoardVO {
	private int boardNo;
	private String boardTitle;
	private String boardThumbnail;
	private String boardContent;
	private String boardAttach;
	private int memberNo;
	private int productNo;
	private int price;
	private int score;
	private String productName;
	private int productCount;
	private int subCategoryNo;
	private String subCategoryName;
	private int themeNo;
	private int companyNo;
	private String crn;
	private String companyName;
	private String companyPhone;
	private String companyAddr;
}
