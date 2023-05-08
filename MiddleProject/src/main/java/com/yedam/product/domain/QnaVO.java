package com.yedam.product.domain;

import java.util.Date;

import lombok.Data;


@Data
public class QnaVO {
	private int qnaNo;
	private String qnaCategory;
	private String qnaTitle;
	private String qnaContent;
	private Date qnaDate;
	private int qnaHide;
	private int memberNo;
	private int boardNo;
	private String qnaAnswer;
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public String getQnaCategory() {
		return qnaCategory;
	}
	public void setQnaCategory(String qnaCategory) {
		this.qnaCategory = qnaCategory;
	}
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public String getQnaContent() {
		return qnaContent;
	}
	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}
	public Date getQnaDate() {
		return qnaDate;
	}
	public void setQnaDate(Date qnaDate) {
		this.qnaDate = qnaDate;
	}
	public int getQnaHide() {
		return qnaHide;
	}
	public void setQnaHide(int qnaHide) {
		this.qnaHide = qnaHide;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	
	
	
}
