package com.yedam.member.domain;

import java.util.Date;

import lombok.Data;


@Data
public class deliveryVO {
	private int deliveryNo;
	private int fee;
	private Date daliDate;
	private String deliveryState;
	
}
