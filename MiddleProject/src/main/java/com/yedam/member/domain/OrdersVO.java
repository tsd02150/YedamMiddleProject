package com.yedam.member.domain;

import java.util.Date;

import lombok.Data;


@Data
public class OrdersVO {
	private int orderNo;
	private Date orderDate;
	private int memberNo;
	private int deliveryNo;
	private String productName;
	private int price;
	private int productCount;
	private int mainCategoryNo;
	private int subCategoryNo;
	private String subCategoryName;
	private String boardThumbnail;
	private String boardContent;
	private int productNo;
	private int orderCount;
	private String deliveryState;
	private String setting;
	
	
	
}
