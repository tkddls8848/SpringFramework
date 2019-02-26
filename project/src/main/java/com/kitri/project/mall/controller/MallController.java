package com.kitri.project.mall.controller;

import java.net.HttpCookie;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kitri.project.mall.Mall;

@Controller
@RequestMapping(value="/mall")
public class MallController {
	
	@ModelAttribute(value="servertime")
	public String servertime(Locale locale) {
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		return dateFormat.format(date);
	}
	
	@RequestMapping("/main")
	public String main(Mall mall, 
			@CookieValue(value="gender", required=false) Cookie cookie) {
		
		if(cookie != null) 
			mall.setMemGENDER(cookie.getValue());
		
		return "mall/mallMain";
	}
	
	@RequestMapping("/login")
	public String login(Mall mall, HttpServletResponse response) {
		
		Cookie cookie = new Cookie("gender", mall.getMemGENDER());
		
		if(mall.getCookie()) {
			cookie.setMaxAge(0);
			mall.setMemGENDER(null);
		}else {
			cookie.setMaxAge(5);
		}
		
		response.addCookie(cookie);
		
		return "mall/mallLoginOK";
	}
	
}
