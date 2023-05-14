package com.yedam.notice.service;

import java.util.List;

import com.yedam.notice.domain.NoticeVO;

public interface NoticeService {
	//고객센터
	public boolean CustomerAdd(NoticeVO vo);//등록
	public NoticeVO getCustomer(int noticeNo);//조회
	public boolean ModifyCustomer(NoticeVO vo);//수정
	public boolean DelCustomer(int noticeNo);//삭제
	
	public List<NoticeVO> CustomerCenter(int page);
	public int CustomerCount();
	
	//FAQ
	public List<NoticeVO> searchFaq(int page);
	public int getFaqCount();
	
	//공지사항
	public boolean addNoti(NoticeVO vo); //등록
	public NoticeVO getNoti(int noticeNo);//조회
	public boolean modifyNoti(NoticeVO vo);//수정
	public boolean delNoti(int noticeNo);//삭제
	
	public List<NoticeVO> notiList(int page);
	public int notiCount();
	
	
	
}
