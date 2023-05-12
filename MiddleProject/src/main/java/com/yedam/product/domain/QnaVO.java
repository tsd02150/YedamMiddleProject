package com.yedam.product.domain;

import java.sql.Date;

import lombok.Data;


@Data
public class QnaVO {
	private int qnaNo;
	private String qnaCategory;
	private String qnaTitle;
	private String qnaContent;
	private Date qnaDate;
	private int qnaHide;
	private int memberNo;
	private int boardNo;
	private String qnaAnswer;
	
	private int productNo;
	private String productName;
	private String email;
	private String name;
	private String id;
	private int orderNo;
	private int page;
	private String orderDate;

}
