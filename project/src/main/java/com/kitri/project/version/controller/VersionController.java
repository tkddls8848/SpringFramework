package com.kitri.project.version.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/version")
public class VersionController {

	@RequestMapping("/version")
	public String Version() {
		return "/version/version";
	}
	
	@RequestMapping("/jusoPopup")
	public String JusoPopup() {
		return "/version/jusoPopup";
	}	
}
