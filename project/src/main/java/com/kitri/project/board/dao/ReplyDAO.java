package com.kitri.project.board.dao;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kitri.project.board.ReplyDTO;

@Repository
public class ReplyDAO implements IReplyDAO{

	@Inject
	SqlSession sqlsession;

	@Override
	public void update(ReplyDTO replyDTO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insert(ReplyDTO replyDTO) {
		sqlsession.insert("reply.listReply", replyDTO);
	}

	@Override
	public int count(int bno) {
		return sqlsession.selectOne("reply.count", bno);
	}

	@Override
	public List<ReplyDTO> list(Integer bno, int start, int end, Principal principal) {
		Map<String, Object> map = new HashMap<>();
		map.put("bno", bno);
		map.put("start", start);
		map.put("end", end);
		return sqlsession.selectList("reply.listReply", map);
	}

	@Override
	public void delete(int rno) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ReplyDTO detail(int rno) {
		// TODO Auto-generated method stub
		return null;
	}

}
