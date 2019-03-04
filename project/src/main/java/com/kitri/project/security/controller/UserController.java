package com.kitri.project.security.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.WebAttributes;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kitri.project.security.dao.UserDAO;
import com.kitri.project.security.service.ShaEncoder;

@Controller
public class UserController {

	@Inject
	private UserDAO UserDAO;
	
	@Inject
	private ShaEncoder shaEncoder;
	
	@RequestMapping(value = "/")//로그인 수행 시큐리티빈설정에 있음
	public String Login() {
		return "/user/login";
	}

	@RequestMapping(value = "/user/join.do")//가입 수행
	public String Join() {
		return "/user/join";
	}	
	
	@RequestMapping(value = "/user/insertUser.do")//인원 추가 map 대신 memberDTO이용예정
	public String insertUser(String userid, String passwd, String name, String authority) {
		
		String dbpw = shaEncoder.SaltEncoding(passwd, userid);
		
		Map<String,String> map = new HashMap<>();
		map.put("userid", userid);
		map.put("passwd", dbpw);
		map.put("name", name);
		map.put("authority", authority);
		
		int result=UserDAO.insertUser(map);
		System.out.println("result : " + result);
		return "/user/login";
	}	
	
	@RequestMapping(value = "/user/denied")//denied
	public String denied(Model model, HttpServletRequest request, Authentication auth) {
		AccessDeniedException ade = (AccessDeniedException) request.getAttribute(WebAttributes.ACCESS_DENIED_403);
		model.addAttribute("errMsg", ade);
		return "/security/denied";
	}
	
	@RequestMapping(value = "/admin/admin.do")//admin
	public String admin() {
		return "/admin/main";		
	}

	@RequestMapping(value = "/logout.do")//security:logout태그에 url설정과 invaildate
	public String Logout() {
		return "/user/login";
	}	

}