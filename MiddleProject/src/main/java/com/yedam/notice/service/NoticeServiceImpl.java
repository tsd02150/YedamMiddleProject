package com.yedam.notice.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.notice.domain.NoticeVO;
import com.yedam.notice.mapper.NoticeMapper;

public class NoticeServiceImpl implements NoticeService {

	SqlSession session = DataSource.getInstance().openSession(true);
	NoticeMapper mapper = session.getMapper(NoticeMapper.class);


	@Override
	public boolean CustomerAdd(NoticeVO vo) {
		return mapper.CustomerAdd(vo) == 1;
	}

	@Override
	public NoticeVO getCustomer(int noticeNo) {
		return mapper.GetCustomer(noticeNo);
	}

	@Override
	public boolean ModifyCustomer(NoticeVO vo) {
		return mapper.ModifyCustomer(vo)==1;
	}
	
	@Override
	public boolean DelCustomer(int noticeNo) {
		return mapper.DelCustomer(noticeNo)==1;
	}

	@Override
	public List<NoticeVO> searchFaq(int page) {
		return mapper.selectFaq(page);
	}
	
	
	@Override
	public int getFaqCount() {
		return mapper.getFaqCount();
	}

	
	@Override
	public boolean addNoti(NoticeVO vo) {
		return mapper.addNoti(vo)==1;
	}
	
	@Override
	public NoticeVO getNoti(int noticeNo) {
		return mapper.getNoti(noticeNo);
	}
	
	@Override
	public boolean modifyNoti(NoticeVO vo) {
		return mapper.modifyNoti(vo)==1;
	}
	
	@Override
	public boolean delNoti(int noticeNo) {
		return mapper.delNoti(noticeNo)==1;
	}
	
	@Override
	public List<NoticeVO> notiList(int page) {
		return mapper.notiList(page);
	}
	
	@Override
	public int notiCount() {
		return mapper.notiCount();
	}
	
	@Override
	public List<NoticeVO> CustomerCenter(int page) {
		return mapper.CustomerCenter(page);
	}
	@Override
	public int CustomerCount() {
		return mapper.customerCount();
	}
	
	
	
}
