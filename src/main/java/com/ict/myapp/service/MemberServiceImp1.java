package com.ict.myapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.myapp.dao.MemberDAO;
import com.ict.myapp.vo.MemberVO;

@Service
public class MemberServiceImp1 implements MemberService {
	
	@Autowired
	MemberDAO dao;
	
	@Override
	public int memberInsert(MemberVO vo) {
		return dao.memberInsert(vo);
	}
	@Override
	public MemberVO loginOk(String userid, String userpwd) {
		return dao.loginOk(userid, userpwd);
	}
}
