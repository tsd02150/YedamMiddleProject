package com.yedam.product.domain;

import java.util.Date;

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
	private int mainCategoryNo;
	private String subCategoryName;
	private String mainCategoryName;
	private int themeNo;
	private int companyNo;
	private String crn;
	private String companyName;
	private String companyPhone;
	private String companyAddr;
	

	private String id;
	private int orderNo;
	private String adress;
	private int orderCount;
	private Date daliDate;
	private int deliveryNo;
	private String deliveryState;

	private int orderDetailNo;

	private Date orderDate;
	private String setting;
	private String name;
	private String phone;
	
	
}
