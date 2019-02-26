package com.kitri.project.login.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kitri.project.login.dao.LoginDAO;
import com.kitri.project.member.MemberDTO;

@Service
public class LoginService implements ILoginService{

	@Inject
	LoginDAO loginDao;
	
	@Override
	public String LoginCheck(String memID) {
		return loginDao.LoginCheck(memID);
	}

}
