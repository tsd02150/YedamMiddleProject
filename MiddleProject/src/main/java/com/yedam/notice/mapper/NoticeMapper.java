package com.yedam.notice.mapper;

import java.util.List;

import com.yedam.notice.domain.NoticeVO;

public interface NoticeMapper {
	
	//고객센터 목록조회
	public List<NoticeVO> CustomerCenter();
	//고객센터 글등록
	public int CustomerAdd(NoticeVO vo);
	//고객센터 글조회
	public NoticeVO GetCustomer(int noticeNo);
	//고객센터 글수정
	public int ModifyCustomer(NoticeVO vo);
	//고객센터 글삭제
	public int DelCustomer(int noticeNo);
	
	//자주묻는질문 목록조회
	public List<NoticeVO> selectFaq(int page);
	//자주묻는질문 개수
	public int getFaqCount();
	
	
	//공지사항 목록조회
	public List<NoticeVO> notiList();
	//공지사항 글등록
	public int addNoti(NoticeVO vo);
	//공지사항 글조회
	public NoticeVO getNoti(int noticNo);
	//공지사항 글수정
	public int modifyNoti(NoticeVO vo);
	//공지사항 글삭제
	public int delNoti(int noticeNo);
}
