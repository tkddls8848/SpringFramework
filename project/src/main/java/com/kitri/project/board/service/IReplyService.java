package com.kitri.project.board.service;

import java.security.Principal;
import java.util.List;

import com.kitri.project.board.ReplyDTO;

public interface IReplyService {

	public List<ReplyDTO> list(Integer bno, int start, int end, Principal principal);
	public int count(int bno);
	public void insert(ReplyDTO replyDTO);
	public void update(ReplyDTO replyDTO);
	public void delete(int rno);
	public ReplyDTO detail(int rno);
	
}
