package com.kitri.project.member.service;

import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.project.member.Member;
import com.kitri.project.member.dao.MemberDao;

@Service
public class MemberService implements IMemberService{
	
	@Autowired
	MemberDao dao;

	@Override
	public void memberRegister(Member member) {
		
		dao.memberInsert(member);
		
	}

	@Override
	public void memberSearch(Member member) {
		
		dao.memberSelect(member);

	}

	@Override
	public Member[] memberModify(Member member) {

		Member memBefore = dao.memberSelect(member);
		Member memAfter = dao.memberUpdate(member);
		
		Member[] memstat = {memBefore, memAfter};//수정전 수정후 정보표시
		
		return memstat;
		
	}

	@Override
	public void memberRemove(Member member) {
		
		dao.memberDelete(member);
		
	}

	private void printMember(Member member){
		
		System.out.println(
				"Member ID : " + member.getId() +
				"Member PW : " + member.getPw() +
				"Member EMAIL : " + member.getEmail()
				);
		
	}
	
	private void printMembers(Map<String, Member> map) {
		
		Set<String> keys = map.keySet();//중복 키값 제거
		Iterator<String> i = keys.iterator();//while문 사용을 위한 키 값 순열 정렬
		
		while(i.hasNext()) {
			
			System.out.println(
					
				"Member ID : "+ map.get(keys).getId() +
				"Member PW : "+ map.get(keys).getPw() +
				"Member EMAIL : "+ map.get(keys).getEmail() + 
				"==========================================="
				
				);
			
		}
	}
	
}
