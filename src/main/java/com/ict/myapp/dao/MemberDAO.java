package com.ict.myapp.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ict.myapp.vo.MemberVO;

@Mapper
@Repository
public interface MemberDAO {
	//���̵� �ߺ��˻�
	
	public int memberInsert(MemberVO vo);
	//ȸ�����
	
	//ȸ������
	
	//ȸ��Ż��
	
	//�α���
	public MemberVO loginOk(String userid, String userpwd);
	//���̵�ã��
	
	//��й�ȣã��
}
