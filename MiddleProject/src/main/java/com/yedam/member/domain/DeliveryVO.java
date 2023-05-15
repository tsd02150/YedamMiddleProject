package com.yedam.member.domain;

import java.util.Date;

import lombok.Data;


@Data
public class DeliveryVO {
	private int deliveryNo;
	private int fee;
	private Date daliDate;
	private String deliveryState;
	private int orderNo;
	private Date orderDate;
	private int memberNo;
	private String productName;
	private int price;
	private String boardThumbnail;
	private String boardContent;
	private int productNo;
	private int orderCount;
	private int boardNo;
	
	
	
}
