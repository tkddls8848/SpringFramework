package com.kitri.project.member.service;

import com.kitri.project.member.Member;

public interface IMemberService {

	void memberRegister(String id, String pw, String email, String phone1, String phone2, String phone3);
	Member memberSearch(String id, String pw);
	void memberModify();
	void memberRemove();
	
}
