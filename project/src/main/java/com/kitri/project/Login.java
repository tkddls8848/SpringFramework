package com.kitri.project;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class Login {
	
	@RequestMapping("/login")
	public String login(Model model) {
		model.addAttribute("loginkey", "loginvalue");
		
		return "login";
	}
	
}
