package com.kitri.project.security.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.WebAttributes;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.kitri.project.security.auth.NaverLoginBO;
import com.kitri.project.security.service.ShaEncoder;
import com.kitri.project.security.service.UserService;

@Controller
public class UserController {
	
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Inject
	private UserService userservice;
	
	@Inject
	private ShaEncoder shaEncoder;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	@RequestMapping(value = "/", method={RequestMethod.POST, RequestMethod.GET})//로그인 수행 시큐리티빈설정에 있음
	public String Login(Model model, HttpSession session) {
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		
		System.out.println("네이버:" + naverAuthUrl);
		
		//네이버 
		model.addAttribute("url", naverAuthUrl);

		/* 생성한 인증 URL을 View로 전달 */
		return "/user/login";
	}

	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException {

		OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
        //로그인 사용자 정보를 읽어온다.
	    apiResult = naverLoginBO.getUserProfile(oauthToken);
		System.out.println(apiResult);
		model.addAttribute("result", apiResult);

        /* 네이버 로그인 성공 페이지 View 호출 */
		return "/user/join";
	}

	
	@RequestMapping(value = "/user/join.do")//가입 수행
	public String Join(Model model) {
		System.out.println("NULL");
		model.addAttribute("result", "NULL");
		return "/user/join";
	}	
	
	@RequestMapping(value = "/user/insertUser.do")//인원 추가
	public String insertUser(String userid, String passwd, String name, String authority) {
		
		String dbpw = shaEncoder.SaltEncoding(passwd, userid);
		
		Map<String,String> map = new HashMap<String, String>();
		map.put("userid", userid);
		map.put("passwd", dbpw);
		map.put("name", name);
		map.put("authority", authority);
		
		int result=userservice.insertUser(map);
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

	@RequestMapping(value = "/user/logout.do")//security:logout태그에 url설정과 invaildate
	public String Logout() {
		return "/user/login";
	}	

	@RequestMapping(value = "/user/idCheck.do", method = RequestMethod.POST)
	public @ResponseBody Map<Object, Object> idCheck(String userid) {
		System.out.println(userid);
		int cnt = userservice.idCheck(userid);
		Map<Object, Object> map = new HashMap<Object, Object>();
		
		map.put("cnt", cnt);
		
		System.out.println("cnt"+cnt);
		return map;		
	}

}