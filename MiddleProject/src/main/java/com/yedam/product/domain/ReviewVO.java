package com.yedam.product.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class ReviewVO {
	private int orderNo;
	private int boardNo;
	
	private int reviewNo;
	private String reviewContent;
	private int score;
	private String reviewAttach;
	private Date reviewDate;
	
	private int productNo;
	private String productName;
	
	private int memberNo;
	private String email;
	private String name;
	private String gender;
	private String id;
	
}
