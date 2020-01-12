package com.kitri.project.security.service;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kitri.project.security.dao.UserDAO;

@Service
public class UserService implements IUserService {

	@Inject
	UserDAO userDAO;
	
	@Override
	public Map<String, Object> selectUser(String memID) {
		return userDAO.selectUser(memID);
	}

	@Override
	public int insertUser(Map<String, String> map) {
		return userDAO.insertUser(map);
	}
	
	@Override
	public int idCheck(String userid) {
		return userDAO.idCheck(userid);
	}
}
