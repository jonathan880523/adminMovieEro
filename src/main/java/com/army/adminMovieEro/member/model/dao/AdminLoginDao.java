package com.army.adminMovieEro.member.model.dao;

import com.army.adminMovieEro.member.model.vo.AdminMemberVo;

public interface AdminLoginDao {
	
	public String login(AdminMemberVo vo) throws Exception;
}
