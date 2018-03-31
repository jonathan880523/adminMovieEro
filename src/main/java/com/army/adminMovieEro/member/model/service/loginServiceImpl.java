package com.army.adminMovieEro.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.army.adminMovieEro.member.model.dao.LoginDao;

@Service("loginService")
public class loginServiceImpl implements loginService {
	
	@Autowired LoginDao loginDao;
	
	public boolean checkAdmin(String ADMIN_ID, String ADMIN_PW) {
		System.out.println("Service 도착.........\n아이디 : " + ADMIN_ID + ", 비밀번호 : " +  ADMIN_PW);
		boolean checkStatus = loginDao.loginAdmin(ADMIN_ID, ADMIN_PW);
		
		return checkStatus;
	}

}
