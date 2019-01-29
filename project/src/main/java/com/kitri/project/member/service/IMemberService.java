package com.kitri.project.member.service;

import com.kitri.project.member.Member;

public interface IMemberService {

	void memberRegister(Member member);
	void memberSearch(Member member);
	Member[] memberModify(Member member);
	void memberRemove(Member member);
	
}
