package com.kitri.project.member.dao;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.kitri.project.member.Member;

@Component
public class MemberDao implements IMemberDao{
	
	private HashMap<String, Member> map;

	public MemberDao() {
		map = new HashMap<String, Member>();
	}
	
	@Override
	public Member memberSelect(Member member) {
		
		map.get(member.getId());
		
		return member;
	}

	@Override
	public Map<String, Member> memberInsert(Member member) {
		
		map.put(member.getId(), member);
		
		return map;
		
	}

	@Override
	public Member memberUpdate(Member member) {
		
		map.put(member.getId(), member);
		
		return map.get(member.getId());
	}

	@Override
	public Map<String, Member> memberDelete(Member member) {

		map.remove(member.getId(), member);
		
		return map;
		
	}

}
