package com.yedam.member.domain;

import java.util.Date;

import lombok.Data;


@Data
public class ordersVO {
	private int orderNo;
	private Date orderDate;
	private int memberNo;
	private int deliveryNo;
	
	
	
}
