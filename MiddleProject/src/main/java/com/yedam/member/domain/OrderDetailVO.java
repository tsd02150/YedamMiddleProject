package com.yedam.member.domain;

import lombok.Data;

@Data
public class OrderDetailVO {	
	private int orderDetailNo;
	private int orderCount;
	private int productNo;
	private int orderNo;
	
	private String productName;
	private int price;
	private int mainCategoryNo;
	private int subCategoryNo;
}
