package com.kitri.project.member.dao;

import org.springframework.stereotype.Component;

import com.kitri.project.member.Member;

@Component
public class MemberDao implements IMemberDao{

	@Override
	public Member memberSelect(String id, String pw) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void memberInsert(String id, String pw, String email, int phone1, int phone2, int phone3) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void memberUpdate() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void memberDelete() {
		// TODO Auto-generated method stub
		
	}

}
