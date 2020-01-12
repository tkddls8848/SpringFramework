package com.kitri.project.security.dao;

import java.util.Map;

public interface IUserDAO {
	
	public Map<String, Object> selectUser(String userid);
	public int insertUser(Map<String, String> map);
	public int idCheck(String userid);
}
