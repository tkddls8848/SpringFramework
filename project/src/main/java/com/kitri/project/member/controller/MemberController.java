package com.kitri.project.member.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.project.member.Member;
import com.kitri.project.member.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	//MemberService service = new MemberService();
	@Autowired
	MemberService service;
	
	@ModelAttribute("servertime")
	public String servertime(Locale locale) {

		DateFormat dateformat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		Date date = new Date();

		return dateformat.format(date);
		
	}
		
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String memberJoin(@ModelAttribute("mem") Member member) {		
		
		service.memberRegister(member);
		
		return "joinOK";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String memberSearch(Member member) {
		
		service.memberSearch(member);
		
		return "loginOK";
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public ModelAndView memberModify(Member member) {
		
		Member[] members = service.memberModify(member);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("memBefore", members[0]);
		mav.addObject("memAfter", members[1]);
		mav.setViewName("modifyOK");
		
		return mav;
	}
	
	@RequestMapping(value="/remove", method=RequestMethod.POST)
	public String memberRemove(Member member){
		
		service.memberRemove(member);
		
		return "removeOK";
		
	}
	
}
