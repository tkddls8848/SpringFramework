package com.kitri.project.member.dao;

import java.util.HashMap;

import org.springframework.stereotype.Component;

import com.kitri.project.member.Member;

@Component
public class MemberDao implements IMemberDao{
	
	private HashMap<String, Member> map;

	public MemberDao() {
		map = new HashMap<String, Member>();
	}
	
	@Override
	public Member memberSelect(String id, String pw) {
		
		Member member = map.get(id);
		
		return member;
	}

	@Override
	public void memberInsert(String id, String pw, String email, String phone1, String phone2, String phone3) {
		
		Member member = new Member();
		
		member.setId(id);
		member.setPw(pw);
		member.setEmail(email);
		member.setPhone1(phone1);
		member.setPhone2(phone2);
		member.setPhone3(phone3);
		
		map.put(id, member);
		
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
