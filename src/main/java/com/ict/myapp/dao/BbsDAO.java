package com.ict.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ict.myapp.vo.BbsVO;
import com.ict.myapp.vo.PagingVO;

@Mapper
@Repository
public interface BbsDAO {
	public int bbsInsert(BbsVO vo);
	public int bbsTotalRecord(PagingVO pVO);
	public List<BbsVO> bbsSelect(PagingVO pVO);
	public void hitCount(int news_no);
	public BbsVO bbsViewSelect(int news_no);
	public int bbsUpdate(BbsVO vo);
	public int bbsDelete(int news_no);
}
