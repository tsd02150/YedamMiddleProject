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
	public List<ReplyVO> replyList(int noticeNo) {
		// TODO Auto-generated method stub
		return mapper.replyList(noticeNo);
	}

	@Override
	public boolean addReply(ReplyVO vo) {
		// TODO Auto-generated method stub
		return mapper.insertReply(vo) == 1;
	}

	@Override
	public ReplyVO getReply(int replyNo) {
		// TODO Auto-generated method stub
		return mapper.getReply(replyNo);
	}

	@Override
	public boolean delReply(int replyNo) {
		// TODO Auto-generated method stub
		return mapper.deleteReply(replyNo)==1;
	}

	@Override
	public boolean modifyReply(ReplyVO vo) {
		// TODO Auto-generated method stub
		return mapper.updateReply(vo)==1;
	}

}
