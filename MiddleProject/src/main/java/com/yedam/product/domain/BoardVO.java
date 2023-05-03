package com.yedam.product.domain;

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
}
