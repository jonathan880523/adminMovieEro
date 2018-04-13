package com.army.adminMovieEro.member.model.service;

import com.army.adminMovieEro.member.model.vo.AdminMemberVo;

public interface loginService {
	public boolean checkAdmin(String ADMIN_ID, String ADMIN_PW);
	public AdminMemberVo loadPosition(String ADMIN_ID);
}
