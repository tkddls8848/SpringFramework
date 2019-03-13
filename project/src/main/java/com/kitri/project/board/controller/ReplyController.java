package com.kitri.project.board.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
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
	public void insert(Integer bno, String replytext , ReplyDTO replyDTO, Principal principal) {
		System.out.println("replyinsert");
		System.out.println("bno"+bno);
		System.out.println("replytext"+replytext);
		String userid = principal.getName();
//		int bno = (int) params.get("bno");
//		String replytext = (String) params.get("replytext");
		replyDTO.setUserid(userid);

		replyservice.insert(replyDTO);
	}
	
	@RequestMapping(value="/list.do")
	public @ResponseBody ModelAndView list(int bno,
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
