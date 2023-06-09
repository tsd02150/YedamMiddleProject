package com.yedam.product.domain;

import lombok.Data;

@Data
public class ThemeVO {
	
	private int themeNo;
	private String themeName;
	
	private int productNo;
	private String productName;
	private int price;
	private int productCount;
	
	private int boardNo;
	private String boardTitle;
	private String boardThumbnail;
	private int page;

}


