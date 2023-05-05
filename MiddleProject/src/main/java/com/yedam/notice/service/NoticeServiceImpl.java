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
	public List<NoticeVO> CustomerCenter() {
		// TODO Auto-generated method stub
		return mapper.CustomerCenter();
	}

	@Override
	public boolean CustomerAdd(NoticeVO vo) {
		// TODO Auto-generated method stub
		return mapper.CustomerAdd(vo) == 1;
	}

	@Override
	public NoticeVO getCustomer(int noticeNo) {
		// TODO Auto-generated method stub
		return mapper.GetCustomer(noticeNo);
	}

	@Override
	public boolean ModifyCustomer(NoticeVO vo) {
		// TODO Auto-generated method stub
		return mapper.ModifyCustomer(vo)==1;
	}
	
	@Override
	public boolean DelCustomer(int noticeNo) {
		// TODO Auto-generated method stub
		return mapper.DelCustomer(noticeNo)==1;
	}
	
	
	
}
