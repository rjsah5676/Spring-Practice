package com.ict.myapp.service;

import java.util.List;

import com.ict.myapp.vo.BbsVO;
import com.ict.myapp.vo.PagingVO;

public interface BbsService {
	public int bbsInsert(BbsVO vo);
	public int bbsTotalRecord();
	public List<BbsVO> bbsSelect(PagingVO pVO);
}
