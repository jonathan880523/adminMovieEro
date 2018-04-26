package com.army.adminMovieEro.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.army.adminMovieEro.member.model.dao.LoginDao;
import com.army.adminMovieEro.member.model.vo.AdminMemberVo;

@Service("loginService")
public class loginServiceImpl implements loginService {
	
	@Autowired LoginDao loginDao;
	
	public boolean checkAdmin(String ADMIN_ID, String ADMIN_PW) {
		System.out.println("Service checkAdmin 실행.........");
		boolean checkStatus = loginDao.loginAdmin(ADMIN_ID, ADMIN_PW);
		return checkStatus;
	}

	@Override
	public AdminMemberVo loadPosition(String ADMIN_ID) {
		return loginDao.loadPosition(ADMIN_ID);
	}

}
