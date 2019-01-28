package com.kitri.project.member.controller;

import java.text.DateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kitri.project.member.Member;
import com.kitri.project.member.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	//MemberService service = new MemberService();
	@Autowired
	MemberService service;
		

	@RequestMapping(value="/join", method=RequestMethod.POST)
//	public String memberJoin(Model model, HttpServletRequest request) {
	public String memberJoin(@ModelAttribute("mem") Member member) {		
//		String memID = request.getParameter("memID");
//		String memPW = request.getParameter("memPW");
//		String memEMAIL = request.getParameter("memEMAIL");
//		String memPHONE1 = request.getParameter("memPHONE1");
//		String memPHONE2 = request.getParameter("memPHONE2");
//		String memPHONE3 = request.getParameter("memPHONE3");
		
//		service.memberRegister(memID, memPW, memEMAIL, memPHONE1, memPHONE2, memPHONE3);
		
//		model.addAttribute("memID", memID);
//		model.addAttribute("memPW", memPW);
//		model.addAttribute("memEMAIL", memEMAIL);
//		model.addAttribute("memPHONE1", memPHONE1);
//		model.addAttribute("memPHONE2", memPHONE2);
//		model.addAttribute("memPHONE3", memPHONE3);
		
		service.memberRegister(member.getId(), member.getPw(), member.getEmail(), member.getPhone1(), member.getPhone2(), member.getPhone3());
		
		return "joinOK";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String memberSearch(Member member) {//Ä¿¸Çµå °´Ã¼
		
		service.memberSearch(member.getId(), member.getPw());
		
		return "loginOK";
	}
	
	
}
