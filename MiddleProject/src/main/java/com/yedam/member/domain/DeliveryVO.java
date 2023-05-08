package com.yedam.member.domain;

import java.util.Date;

import lombok.Data;


@Data
public class DeliveryVO {
	private int deliveryNo;
	private int fee;
	private Date daliDate;
	private String deliveryState;
	
	
}
