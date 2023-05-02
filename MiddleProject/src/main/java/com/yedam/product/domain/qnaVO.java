package com.yedam.product.domain;

import java.util.Date;

import lombok.Data;


@Data
public class qnaVO {
	private int qnaNo;
	private String qnaCategory;
	private String qnaTitle;
	private String qnaContent;
	private Date qnaDate;
	private int qnaHide;
	private int memberNo;
	private int boardNo;
	
	
	
}
