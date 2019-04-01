package com.kitri.project.security.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Component
public class UserLoginFailureHandler implements AuthenticationFailureHandler{

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		request.setAttribute("errMsg", "아이디와 비밀번호를 다시 입력하세요.");
		request.getRequestDispatcher("/WEB-INF/views/user/login.jsp").forward(request, response);
		
	}

}
