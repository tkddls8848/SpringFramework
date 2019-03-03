package com.kitri.project.member.service;

import java.util.List;

import com.kitri.project.member.MemberDTO;

public interface IMemberService {

	public MemberDTO memberSelect(String memID);
	public void memberInsert(MemberDTO memberDTO);
	public void memberUpdate(MemberDTO memberDTO);
	public void memberDelete(MemberDTO memberDTO);
	public List<MemberDTO> memberList(int start, int end);
	public boolean checkPw(String memID, String memPW);
	
	public List<MemberDTO> memberListMenu(int start, int end);
	public int memberTotalCount();
}
