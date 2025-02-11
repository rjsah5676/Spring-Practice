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
	public MemberVO memberSelect(String userid);
	
	public int memberUpdate(MemberVO vo);
	//ȸ��Ż��
	
	//�α���
	public MemberVO loginOk(String userid, String userpwd);
	//���̵�ã��
	
	//��й�ȣã��
	
	public int idDuplicate(String userid);
}
