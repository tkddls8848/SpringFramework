package com.kitri.project.member.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kitri.project.member.service.MemberService;

@Controller
public class MemberController {
	
	//MemberService service = new MemberService();
	
	MemberService service;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		
		return "home";
	}
	
	@RequestMapping("/login")
	public String login(Model model) {
		model.addAttribute("loginkey", "loginvalue");
		
		return "login";
	}
	
}
