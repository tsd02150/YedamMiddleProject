package com.yedam.notice.mapper;

import java.util.List;

import com.yedam.notice.domain.NoticeVO;

public interface NoticeMapper {
	
	//고객센터 목록조회
	public List<NoticeVO> CustomerCenter();
	
	//고객센터 문의등록
	public int CustomerAdd();
	
	//고객센터 글조회
	public NoticeVO GetCustomer(int memberNo);
	

}
