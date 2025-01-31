package com.ict.myapp.vo;

import lombok.ToString;

@ToString
public class PagingVO {
	private int nowPage = 1;
	private int onePageRecord = 5;
	
	private int totalRecord;
	private int totalPage;
	private int offset;
	
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
		offset = (nowPage-1)*onePageRecord;
	}
	public int getOnePageRecord() {
		return onePageRecord;
	}
	public void setOnePageRecord(int onePageRecord) {
		this.onePageRecord = onePageRecord;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		
		totalPage = (totalRecord%onePageRecord)==0? totalRecord/onePageRecord : totalRecord/onePageRecord+1;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getOffset() {
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
}
