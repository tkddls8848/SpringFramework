package com.kitri.project.member.dao;

import com.kitri.project.member.Member;

public interface IMemberDao {

	Member memberSelect(String id, String pw);
	void memberInsert(String id, String pw, String email, int phone1, int phone2, int phone3);
	void memberUpdate();
	void memberDelete();
	
}
