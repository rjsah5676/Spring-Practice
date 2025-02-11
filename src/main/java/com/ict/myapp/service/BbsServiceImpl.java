package com.ict.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ict.myapp.dao.BbsDAO;
import com.ict.myapp.vo.BbsVO;
import com.ict.myapp.vo.PagingVO;

@Service
public class BbsServiceImpl implements BbsService{
	
	@Inject
	BbsDAO dao;
	
	@Override
	public int bbsInsert(BbsVO vo) {
		return dao.bbsInsert(vo);
	}

	@Override
	public int bbsTotalRecord(PagingVO pVO) {
		return dao.bbsTotalRecord(pVO);
	}

	@Override
	public List<BbsVO> bbsSelect(PagingVO pVO) {
		return dao.bbsSelect(pVO);
	}

	@Override
	public void hitCount(int news_no) {
		dao.hitCount(news_no);
	}

	@Override
	public BbsVO bbsViewSelect(int news_no) {
		// TODO Auto-generated method stub
		return dao.bbsViewSelect(news_no);
	}

	@Override
	public int bbsUpdate(BbsVO vo) {
		return dao.bbsUpdate(vo);
	}

	@Override
	public int bbsDelete(int news_no) {
		return dao.bbsDelete(news_no);
	}
	
	
}
