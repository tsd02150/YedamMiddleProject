package com.yedam.notice.mapper;

import java.util.List;

import com.yedam.notice.domain.NoticeVO;

public interface NoticeMapper {
	
	//고객센터 목록조회
	public List<NoticeVO> CustomerCenter();
	
	//고객센터 문의등록
	public int CustomerAdd(NoticeVO vo);
	
	//고객센터 글조회
	public NoticeVO GetCustomer(int noticeNo);
	
	//고객센터 글수정
	public int ModifyCustomer(NoticeVO vo);
	
	//고객센터 글삭제
	public int DelCustomer(int noticeNo);
	

}
