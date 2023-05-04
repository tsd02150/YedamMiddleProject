package com.yedam.notice.service;

import java.util.List;

import com.yedam.notice.domain.NoticeVO;

public interface NoticeService {
	
	public List<NoticeVO> CustomerCenter();
	
	public boolean CustomerAdd(NoticeVO vo);

	public NoticeVO getCustomer(int noticeNo);
	
	public boolean ModifyCustomer(NoticeVO vo);
	
	public boolean DelCustomer(int noticeNo);
	
	
	
}
