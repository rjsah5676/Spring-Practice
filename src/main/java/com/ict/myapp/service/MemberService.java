package com.ict.myapp.service;

import com.ict.myapp.vo.MemberVO;

public interface MemberService {
	public int memberInsert(MemberVO vo);
	public MemberVO loginOk(String userid, String userpwd);
}
