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
public class MemberDAO implements IMemberDAO{
	
	private static final Logger logger = 
			LoggerFactory.getLogger(MemberDAO.class);
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<MemberDTO> memberList(int start, int end) {
		logger.info("memberList");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);	
		
		List<MemberDTO> list = sqlSession.selectList("member.memberList", map);
		return list;
	}

	@Override
	public MemberDTO memberSelect(String userid) {
		logger.info("memberSelect");
		MemberDTO memberDTO = sqlSession.selectOne("member.memberSelect", userid);
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
	public boolean checkPw(String userid, String memPW) {
		logger.info("checkPw");

		return true;
	}

	@Override
	public List<MemberDTO> memberListMenu(int start, int end) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);		
		
		return sqlSession.selectList("member.memberListMenu", map);
	}

	@Override
	public int memberTotalCount() {
		return sqlSession.selectOne("member.memberTotalCount");
	}
}