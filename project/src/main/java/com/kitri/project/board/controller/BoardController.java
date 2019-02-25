package com.kitri.project.board.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.project.board.BoardDTO;
import com.kitri.project.board.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	BoardService boardservice;
	
	@ModelAttribute("servertime")
	public String servertime(Locale locale) {

		DateFormat dateformat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		Date date = new Date();

		return dateformat.format(date);
		
	}
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public ModelAndView boardList() {		
		
		List<BoardDTO> list = boardservice.selectAllBoard(1, 2, "keyword", "mode");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);
		mav.setViewName("board/boardList");
		
		return mav;
	}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String boardWrite() {		
		
		return "board/boardWrite";
	}
	
}
