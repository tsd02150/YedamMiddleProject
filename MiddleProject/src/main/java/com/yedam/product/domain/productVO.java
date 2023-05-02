package com.yedam.product.domain;

import lombok.Data;

@Data

public class productVO {
	
	private int productNo;
	private String productName;
	private int price;
	private int productCount;
	private int companyNo;
	private int subCategoryNo;
	private int themeNo;
}
