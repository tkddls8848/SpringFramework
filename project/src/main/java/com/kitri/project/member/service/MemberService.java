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
		
		printMembers(dao.memberInsert(member));
		
	}

	@Override
	public void memberSearch(Member member) {
		
		printMember(dao.memberSelect(member));

	}

	@Override
	public Member[] memberModify(Member member) {

		Member memBefore = dao.memberSelect(member);
		Member memAfter = dao.memberUpdate(member);
		printMember(memAfter);
		Member[] memstat = {memBefore, memAfter};//수정전 수정후 정보표시
		
		return memstat;
		
	}

	@Override
	public void memberRemove(Member member) {
		
		printMembers(dao.memberDelete(member));
		
	}

	private void printMember(Member member){
		
		System.out.println(
				"Member ID : " + member.getMemID() + "||" +
				"Member PW : " + member.getMemPW() + "||" +
				"Member EMAIL : " + member.getMemEMAIL()
				);
		
	}
	
	private void printMembers(Map<String, Member> map) {
		
		Set<String> keys = map.keySet();//중복 키값 제거
		Iterator<String> i = keys.iterator();//while문 사용을 위한 키 값 순열 정렬
		
		while(i.hasNext()) {
			
			String key = i.next();
			Member member = map.get(key);
			
			printMember(member);
			
		}
	}
	
}
