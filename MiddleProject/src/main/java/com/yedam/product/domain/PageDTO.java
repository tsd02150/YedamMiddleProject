package com.yedam.product.domain;


import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int pageNum;
	
	public PageDTO(int pageNum, int total) {
		this.pageNum = pageNum;
		this.endPage = (int) Math.ceil(this.pageNum/10.0)*10;
		this.startPage = this.endPage-9;
		
		int realEnd = (int) (Math.ceil(total/10.0));
		if(realEnd<this.endPage) {
			this.endPage = realEnd;
		}
		this.prev = this.startPage>1;
		this.next = this.endPage <realEnd;
	}
}
