package com.ict.myapp.vo;

import lombok.Data;

@Data
public class BbsReplyVO {
	private int reply_no;
	private int news_no;
	private String comment;
	private String userid;
	private String writedate;
}
