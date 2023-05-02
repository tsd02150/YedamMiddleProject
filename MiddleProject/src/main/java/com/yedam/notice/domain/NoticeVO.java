package com.yedam.notice.domain;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeVO {
	
	//NOTICE 테이블
//	NOTICE_NO       NOT NULL NUMBER         
//	NOTICE_TITLE    NOT NULL VARCHAR2(1000) 
//	NOTICE_CONTENT  NOT NULL VARCHAR2(2000) 
//	NOTICE_DATE              DATE           
//	NOTICE_ATTACH            VARCHAR2(200)  
//	NOTICE_RESPONSE          VARCHAR2(2000) 
//	SELECTOR        NOT NULL NUMBER         
//	MEMBER_NO                NUMBER      
	
	
	private int noticeNo;
	private String noticeTitle;
	private String notiveContent;
	private Date noticeDate;
	private String noticeAttach;
	private String noticeResponse;
	private int selector;	

}
