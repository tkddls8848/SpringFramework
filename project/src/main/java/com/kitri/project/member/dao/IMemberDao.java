package com.kitri.project.member.dao;

import java.util.HashMap;
import java.util.Map;

import com.kitri.project.member.MemberDTO;

public interface IMemberDao {

	MemberDTO memberSelect(MemberDTO member);
	int memberInsert(MemberDTO member);
	int memberUpdate(MemberDTO member);
	int memberDelete(MemberDTO member);
	
}
