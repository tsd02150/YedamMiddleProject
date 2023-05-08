package com.yedam.notice.service;

import java.util.List;

import com.yedam.notice.domain.NoticeVO;

public interface NoticeService {
	//고객센터
	public List<NoticeVO> CustomerCenter();//목록
	public boolean CustomerAdd(NoticeVO vo);//등록
	public NoticeVO getCustomer(int noticeNo);//조회
	public boolean ModifyCustomer(NoticeVO vo);//수정
	public boolean DelCustomer(int noticeNo);//삭제
	
	//FAQ
	public List<NoticeVO> searchFaq();
	
	
	//공지사항
	public List<NoticeVO> notiList(); //목록
	public boolean addNoti(NoticeVO vo); //등록
	public NoticeVO getNoti(int noticeNo);//조회
	
	
}
