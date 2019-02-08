package com.kitri.project.board.service;

import com.kitri.project.member.MemberDTO;

public interface IBoardService {

	void memberRegister(MemberDTO member);
	MemberDTO memberSearch(MemberDTO member);
	MemberDTO memberModify(MemberDTO member);
	int memberRemove(MemberDTO member);
	
}
