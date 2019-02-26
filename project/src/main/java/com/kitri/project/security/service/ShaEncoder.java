package com.kitri.project.security.service;

import javax.annotation.Resource;

import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class ShaEncoder {
	
	@Resource(name = "passwordEncoder")
	private ShaPasswordEncoder encoder;
	
	public String encoding(String string) {
		return encoder.encodePassword(string, null);
	}
	
	public String SaltEncoding(String string, String salt) {
		return encoder.encodePassword(string, salt);
	}
	
}
