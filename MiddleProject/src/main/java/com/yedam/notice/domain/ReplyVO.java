package com.yedam.notice.domain;

import lombok.Data;

@Data
public class ReplyVO {

	
//
//create table cc_reply(
//reply_no number primary key,
//reply_content varchar(1000) not null,
//reply_writer varchar(20) default 'admin',
//notice_no number,
//FOREIGN KEY(notice_no) REFERENCES notice(notice_no) on delete cascade
//);
	

	private int replyNo;
	private String replyContent;
	private String replyWriter;
	private int noticeNo;

}
