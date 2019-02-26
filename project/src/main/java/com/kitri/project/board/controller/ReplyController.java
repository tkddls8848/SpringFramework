package com.kitri.project.board.controller;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kitri.project.board.ReplyDTO;

@RestController
@RequestMapping("/reply/*")
public class ReplyController {

	@Inject
	ReplyService replyservice;
	
	@RequestMapping("insert.do")
	public void insert(ReplyDTO replydto) {
		String userid = 
	}
	
}
