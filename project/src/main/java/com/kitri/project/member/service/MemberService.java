package com.kitri.project.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.project.member.Member;
import com.kitri.project.member.dao.MemberDao;

@Service
public class MemberService implements IMemberService{
	
	@Autowired
	MemberDao dao;

	@Override
	public void memberRegister(String id, String pw, String email, String phone1, String phone2, String phone3) {
		
		dao.memberInsert(id, pw, email, phone1, phone2, phone3);
		
	}

	@Override
	public Member memberSearch(String id, String pw) {
		
		Member member = dao.memberSelect(id, pw);
		
		return member;
	}

	@Override
	public void memberModify() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void memberRemove() {
		// TODO Auto-generated method stub
		
	}

}
