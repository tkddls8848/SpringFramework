package com.kitri.project.board.service;

import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.project.member.MemberDTO;
import com.kitri.project.member.dao.MemberDao;

@Service
public class BoardService implements IBoardService{
	
	@Autowired
	MemberDao dao;

	@Override
	public void memberRegister(MemberDTO member) {
		
		int result = dao.memberInsert(member);
		
		if(result == 0) {
			System.out.println("member insert fail");
		} else {
			System.out.println("member insert success");
		}
		
	}

	@Override
	public MemberDTO memberSearch(MemberDTO member) {
		
		MemberDTO mem = dao.memberSelect(member);
		
		if(mem != null) {
			System.out.println("select complete");
		} else {
			System.out.println("select fail");
		}
		
		return mem;

	}

	@Override
	public MemberDTO memberModify(MemberDTO member) {

		int result = dao.memberUpdate(member);
		
		if(result != 0) {
			System.out.println("update complete");
		} else {
			System.out.println("update fail");
			return null;
		}
		
		return member;
		
	}

	@Override
	public int memberRemove(MemberDTO member) {
		
		int result = dao.memberDelete(member);
		
		if(result != 0) {
			System.out.println("update complete");
		} else {
			System.out.println("update fail");
		}
		return result;
	}
	
}
