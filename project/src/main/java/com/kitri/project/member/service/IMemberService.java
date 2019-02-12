package com.kitri.project.member.service;

import com.kitri.project.member.MemberDTO;

public interface IMemberService {

	void memberRegister(MemberDTO member);
	MemberDTO memberSearch(MemberDTO member);
	MemberDTO memberModify(MemberDTO member);
	int memberRemove(MemberDTO member);
	
}
