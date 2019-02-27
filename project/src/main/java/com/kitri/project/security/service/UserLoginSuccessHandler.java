package com.kitri.project.security.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.kitri.project.security.user.UserDTO;

@Component
public class UserLoginSuccessHandler implements AuthenticationSuccessHandler{

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		UserDTO userDTO = (UserDTO) authentication.getPrincipal();
		String msg = userDTO.getUserid()+"님 환영합니다.";
		request.setAttribute("msg", msg);
		RequestDispatcher rd = request.getRequestDispatcher("/board/list");
		rd.forward(request, response);
		
	}

}
