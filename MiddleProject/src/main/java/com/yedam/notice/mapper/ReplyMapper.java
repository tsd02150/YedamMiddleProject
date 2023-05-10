package com.yedam.notice.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.notice.domain.ReplyVO;

public interface ReplyMapper {

	public List<ReplyVO> replyList(int noticeNo);

	public int insertReply(ReplyVO vo);

	// 댓글삭제.
	public int deleteReply(int replyNo);

	public int updateReply(@Param("replyNo") int replyNo, @Param("reply") String reply);

	public int updateReply(ReplyVO vo);

	public ReplyVO getReply(int replyNo);

}
