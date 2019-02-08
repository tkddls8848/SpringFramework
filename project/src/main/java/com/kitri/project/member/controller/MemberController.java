package com.kitri.project.member.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.project.member.MemberDTO;
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
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String main() {
		return "main";
	}
	
	@RequestMapping(value="/redirect", method=RequestMethod.GET)
	public String redirect() {
		return "redirect";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String memberInsert(@ModelAttribute("mem") MemberDTO member, HttpSession session) {		
		
		session.setAttribute("session", member);
		
		service.memberRegister(member);
		
		return "member/joinOK";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String memberSearch(MemberDTO member, HttpSession session) {
		
		MemberDTO m = service.memberSearch(member);
		session.setAttribute("session", m);
		
		return "member/loginOK";
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String memberLogout(MemberDTO member, HttpSession session) {
		session.invalidate();
		return "member/logoutOK";
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public ModelAndView memberModify(MemberDTO member, HttpSession session) {
			
		MemberDTO members = service.memberModify(member);
		
		session.setAttribute("session", members);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("memINFO", members);
		mav.setViewName("member/modifyOK");
					
		return mav;

	}
	
	@RequestMapping(value="/remove", method=RequestMethod.GET)
	public String memberRemove(MemberDTO member, Model model, HttpSession session){
		
		MemberDTO mem = (MemberDTO) session.getAttribute("session");
		
		if(mem == null) {
			
			return "redirect:/member/redirect";
			
		} else {
			
			String s = member.getMemID();
			model.addAttribute("mem", s);
			
			session.invalidate();
			
			service.memberRemove(member);
			
			return "member/removeOK";
			
		}
			
	}
	
}
