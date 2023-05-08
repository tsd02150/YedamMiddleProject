package com.yedam.notice.mapper;

import java.util.List;

import com.yedam.notice.domain.ReplyVO;

public interface ReplyMapper {
	
	public List<ReplyVO> replyList(int noticeNo);
	
	public int insertReply(ReplyVO vo);

	

}
