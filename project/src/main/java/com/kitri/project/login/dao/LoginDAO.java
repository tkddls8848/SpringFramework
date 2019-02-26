package com.kitri.project.login.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDAO implements ILoginDAO{

	@Inject
	SqlSession sqlSession;

	@Override
	public String LoginCheck(String memID) {
		return sqlSession.selectOne("login.loginCheck", memID);
	}
	
}
