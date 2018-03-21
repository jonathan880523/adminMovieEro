package com.army.adminMovieEro.member.model.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.army.adminMovieEro.member.model.vo.AdminMemberVo;

@Repository
public class AdminLoginDaoImpl implements AdminLoginDao {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.army.mapper.movieAddList-mapper";

	@Override
	public String login(AdminMemberVo vo) throws Exception {
		session.selectOne(namespace+".select", vo);
		return null;
	}
}
