package com.army.adminMovieEro.member.model.dao;

import com.army.adminMovieEro.member.model.vo.AdminMemberVo;

public interface LoginDao {
	public boolean loginAdmin(String ADMIN_ID, String ADMIN_PW);
	public AdminMemberVo loadPosition(String ADMIN_ID);
}
