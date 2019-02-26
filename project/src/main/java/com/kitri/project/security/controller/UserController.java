package com.kitri.project.security.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.WebAttributes;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.project.login.service.LoginService;
import com.kitri.project.security.service.ShaEncoder;
import com.kitri.project.security.service.UserService;

@Controller
public class UserController {

	@Inject
	private UserService userService;
	
	@Inject
	private LoginService loginService;
	
//	@Inject
//	private BCryptPasswordEncoder bcpe;
	
	@Inject
	private ShaEncoder shaEncoder;	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)//로그인 페이지
	public String Main(Model model) {
		return "home";
	}
	
	@RequestMapping(value = "/user/login.do")//로그인 수행 시큐리티빈설정에 있음
	public String Login() {
		return "/user/login";
	}

	@RequestMapping(value = "/user/join.do")//가입 수행
	public String Join() {
		return "/user/join";
	}
	
	@RequestMapping(value = "/user/denied")
	public String denied(Model model, HttpServletRequest request, Authentication auth) {
		AccessDeniedException ade = (AccessDeniedException) request.getAttribute(WebAttributes.ACCESS_DENIED_403);
		model.addAttribute("errMsg", ade);
		return "/security/denied";
	}
	
	@RequestMapping(value = "/user/adminList.do")
	public String adminList() {
		return "/security/adminList";		
	}
	
//	@RequestMapping(value = "/user/memberInsert.do")
//	public String memberInsert(@RequestParam String memID, @RequestParam String passwd, @RequestParam String name, @RequestParam String authority) {
//		Map<String, String> map = new HashMap<>();
//		map.put("memID", memID);
//		
//		String npass = bcpe.encode(passwd);
//		System.out.println("암호화비번 : " + npass);
//		map.put("passwd", npass);
//		map.put("name", name);
//		map.put("authority", authority);
//		
//		userService.insertUser(map);
//		return "/";		
//	}	
	
	@RequestMapping(value = "/logout.do")
	public String Logout(HttpSession session) {
		session.invalidate();
		return "login";
	}	
}