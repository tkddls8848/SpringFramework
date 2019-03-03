package com.kitri.project.board.service;

import java.security.Principal;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kitri.project.board.ReplyDTO;
import com.kitri.project.board.dao.ReplyDAO;

@Service
public class ReplyService implements IReplyService {

	@Inject
	ReplyDAO replydao;

	@Override
	public void update(ReplyDTO replyDTO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insert(ReplyDTO replyDTO) {
		System.out.println("replydaoinsert");
		replydao.insert(replyDTO);
	}

	@Override
	public int count(int bno) {
		return replydao.count(bno);
	}

	@Override
	public List<ReplyDTO> list(Integer bno, int start, int end, Principal principal) {
		return replydao.list(bno, start, end, principal);
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
