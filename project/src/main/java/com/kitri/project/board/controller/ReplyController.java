package com.kitri.project.board.controller;

import java.security.Principal;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.project.board.ReplyDTO;
import com.kitri.project.board.service.ReplyService;
import com.kitri.project.board.service.page.Pager;

@RestController
@RequestMapping("/reply")
public class ReplyController {
	
	@Inject
	ReplyService replyservice;
	
	@RequestMapping(value="/insert.do", method=RequestMethod.POST)
	@ResponseBody
	public void insert(ReplyDTO replyDTO, Principal principal) {
		System.out.println("replyinsert");
		String userid = principal.getName();
		System.out.println(userid);
		replyDTO.setUserid(userid);
		replyservice.insert(replyDTO);
	}
	
	@RequestMapping(value="/list.do")
	@ResponseBody
	public ModelAndView list(int bno,
			@RequestParam(defaultValue = "1") int curPage,
			ModelAndView mav, Principal principal) {
		System.out.println("replylist");
		int count = replyservice.count(bno);
		Pager pager = new Pager(count, curPage);
		int Start = pager.getPageBegin();
		int End = pager.getPageEnd();
		List<ReplyDTO> list = replyservice.list(bno, Start, End, principal);
		
		mav.setViewName("/board/replyList");
		mav.addObject("list", list);
		mav.addObject("pager", pager);
		
		return mav;
	}	
	
}
