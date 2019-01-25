package com.kitri.project.member.service;

import com.kitri.project.member.Member;

public interface IMemberService {

	void memberRegister(String id, String pw, String email, int phone1, int phone2, int phone3);
	Member memberSearch(String id, String pw);
	void memberModify();
	void memberRemove();
	
}
