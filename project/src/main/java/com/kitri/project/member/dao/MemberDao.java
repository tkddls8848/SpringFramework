package com.kitri.project.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.kitri.project.member.MemberDTO;

@Repository
public class MemberDao implements IMemberDao{
	
	private static final Logger logger = 
			LoggerFactory.getLogger(MemberDao.class);
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<MemberDTO> memberList() {
		logger.info("memberList");
		List<MemberDTO> list = sqlSession.selectList("member.memberList");
		return list;
	}

	@Override
	public MemberDTO memberSelect(String memID) {
		logger.info("memberSelect");
		MemberDTO memberDTO = sqlSession.selectOne("member.memberSelect", memID);
		return memberDTO;
	}
	
	@Override
	public void memberInsert(MemberDTO memberDTO) {
		logger.info("memberInsert");
		sqlSession.insert("member.memberInsert", memberDTO);
	}

	@Override
	public void memberUpdate(MemberDTO memberDTO) {
		logger.info("memberUpdate");
		sqlSession.update("member.memberUpdate", memberDTO);
	}

	@Override
	public void memberDelete(MemberDTO memberDTO) {
		logger.info("memberDelete");
		sqlSession.delete("member.memberDelete", memberDTO);		
	}

	@Override
	public boolean checkPw(String memID, String memPW) {
		logger.info("checkPw");
		boolean check = false;
		Map<String, String> map = new HashMap<String, String>();
		map.put("memPW", memPW);
		int count = sqlSession.selectOne("member.checkPw", map);
		if(count == 1) {
			check = true;
		}
		return check;
	}


}