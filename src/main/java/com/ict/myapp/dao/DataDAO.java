package com.ict.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ict.myapp.vo.DataVO;

@Mapper
@Repository
public interface DataDAO {
	public int dataInsert(DataVO vo);
	public List<DataVO> dataAllSelect();
	public DataVO dataSelect(int no);
	public int dataUpdate(DataVO vo);
}
