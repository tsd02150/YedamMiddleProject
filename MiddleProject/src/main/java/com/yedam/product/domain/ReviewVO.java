package com.yedam.product.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class ReviewVO {
	private int reviewNo;
	private String reviewContent;
	private int score;
	private String reviewAttach;
	private Date reviewDate;
	private int memberNo;
	private int boardNo;
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getReviewAttach() {
		return reviewAttach;
	}
	public void setReviewAttach(String reviewAttach) {
		this.reviewAttach = reviewAttach;
	}
	public Date getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
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
