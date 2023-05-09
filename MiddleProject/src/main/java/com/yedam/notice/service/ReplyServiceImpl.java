package com.yedam.notice.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.notice.domain.ReplyVO;
import com.yedam.notice.mapper.ReplyMapper;

public class ReplyServiceImpl implements ReplyService {

	SqlSession session = DataSource.getInstance().openSession(true);
	ReplyMapper mapper = session.getMapper(ReplyMapper.class);

	@Override
	public List<ReplyVO> replyList(int noticeId) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public boolean addReply(ReplyVO vo) {
		// TODO Auto-generated method stub
		return mapper.insertReply(vo)==1;
	}


}
