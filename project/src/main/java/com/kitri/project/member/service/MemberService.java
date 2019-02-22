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
	MemberDAO memberDao;

	@Override
	public MemberDTO memberSelect(String memID) {
		MemberDTO memberDTO = memberDao.memberSelect(memID);
		return memberDTO;
	}

	@Override
	public void memberInsert(MemberDTO memberDTO) {
		memberDao.memberInsert(memberDTO);
	}

	@Override
	public void memberUpdate(MemberDTO memberDTO) {
		memberDao.memberUpdate(memberDTO);
	}

	@Override
	public void memberDelete(MemberDTO memberDTO) {
		memberDao.memberDelete(memberDTO);
	}

	@Override
	public List<MemberDTO> memberList() {
		return memberDao.memberList();
	}

	@Override
	public boolean checkPw(String memID, String memPW) {
		return memberDao.checkPw(memID, memPW);
	}


}
