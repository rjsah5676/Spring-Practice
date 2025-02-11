package com.ict.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ict.myapp.vo.BbsReplyVO;

@Mapper
@Repository
public interface BbsReplyDAO {
	public int replyInsert(BbsReplyVO vo);
	public List<BbsReplyVO> replyList(int news_no);
	public int replyUpdate(BbsReplyVO vo);
	public int replyDelete(int reply_no);
}
