package com.yedam.member.domain;

import lombok.Data;

@Data
public class WishVO {
	private int wishNo;
	private int productNo;
	private int memberNo;
	private String id;
	private String productName;
	private int price;
	private int productCount;
	private String subCategoryName;
	private String boardThumbnail;
	private String boardContent;
	
	
}
