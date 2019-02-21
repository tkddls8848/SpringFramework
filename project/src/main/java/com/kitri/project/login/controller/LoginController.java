package com.kitri.project.login.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.project.login.service.LoginService;

@Controller
public class LoginController {

	@Inject
	LoginService loginService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String Login(Model model) {
		return "login";
	}
	
	@RequestMapping(value = "/login")
	public ModelAndView LoginCheck(@RequestParam String memID, @RequestParam String memPW, HttpSession session) {
		String idCheck = loginService.LoginCheck(memID);
		ModelAndView mav = new ModelAndView();
		
		if (idCheck != null) {
			mav.setViewName("redirect:/member/list");
			session.setAttribute("session", memID);
			return mav;
		} else {
			mav.setViewName("login");
			mav.addObject("message","error");
			return mav;			
		}
	}
	
	@RequestMapping(value = "/logout.do")
	public String Logout(HttpSession session) {
		session.invalidate();
		return "login";
	}
}