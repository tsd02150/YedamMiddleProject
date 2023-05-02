package com.yedam.product.domain;

import lombok.Data;

@Data
public class ProductVO {
	private int prodNo;
	private String prodName;
	private int price;
	private int prodCount;
	private int companyNO;
	private int subCateNo;
	private int themeNo;
}
