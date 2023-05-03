package com.yedam.product.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class ReviewVO {
	private int reviewNo;
	private String reviewContent;
	private int score;
	private String reviewAttach;
	private Date reviewDate;
	private int memberNo;
	private int boardNo;
}
