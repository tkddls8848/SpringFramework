package com.kitri.project.security.service;

import java.util.Map;

public interface IUserService {
	
	public Map<String, Object> selectUser(String userid);
	public int insertUser(Map<String, String> map);
	public int idCheck(String userid);
}
