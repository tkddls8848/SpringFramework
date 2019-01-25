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
	public void memberRegister(String id, String pw, String email, int phone1, int phone2, int phone3) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Member memberSearch(String id, String pw) {
		// TODO Auto-generated method stub
		return null;
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
