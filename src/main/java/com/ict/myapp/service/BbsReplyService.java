package com.ict.myapp.service;

import java.util.List;

import com.ict.myapp.vo.BbsReplyVO;

public interface BbsReplyService {
	public int replyInsert(BbsReplyVO vo);
	public List<BbsReplyVO> replyList(int news_no);
	public int replyUpdate(BbsReplyVO vo);
	public int replyDelete(int reply_no);
}
