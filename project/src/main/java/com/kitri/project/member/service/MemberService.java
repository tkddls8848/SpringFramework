package com.kitri.project.member.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.project.member.MemberDTO;
import com.kitri.project.member.dao.MemberDAO;

@Service
public class MemberService implements IMemberService{
	
	@Inject
	MemberDAO memberDAO;

	@Override
	public MemberDTO memberSelect(String userid) {
		MemberDTO memberDTO = memberDAO.memberSelect(userid);
		return memberDTO;
	}

	@Override
	public void memberInsert(MemberDTO memberDTO) {
		memberDAO.memberInsert(memberDTO);
	}

	@Override
	public void memberUpdate(MemberDTO memberDTO) {
		memberDAO.memberUpdate(memberDTO);
	}

	@Override
	public void memberDelete(MemberDTO memberDTO) {
		memberDAO.memberDelete(memberDTO);
	}

	@Override
	public List<MemberDTO> memberList(int start, int end) {
		return memberDAO.memberList(start, end);
	}

	@Override
	public boolean checkPw(String userid, String memPW) {
		return memberDAO.checkPw(userid, memPW);
	}

	@Override
	public List<MemberDTO> memberListMenu(int start, int end) {
		return memberDAO.memberListMenu(start, end);
	}

	@Override
	public int memberTotalCount() {
		return memberDAO.memberTotalCount();
	}


}
