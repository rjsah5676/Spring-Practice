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
	public int bbsTotalRecord() {
		return dao.bbsTotalRecord();
	}

	@Override
	public List<BbsVO> bbsSelect(PagingVO pVO) {
		return dao.bbsSelect(pVO);
	}
	
	
}
