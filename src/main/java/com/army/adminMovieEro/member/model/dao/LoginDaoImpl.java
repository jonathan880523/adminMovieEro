package com.army.adminMovieEro.member.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.army.adminMovieEro.member.model.vo.AdminMemberVo;

@Repository("loginDao")
public class LoginDaoImpl implements LoginDao {
	
	@Autowired SqlSession sqlSession;

	@Override
	public boolean loginAdmin(String ADMIN_ID, String ADMIN_PW) {
		System.out.println("DAO 도착 ............\n아이디 : " + ADMIN_ID + ", 비밀번호 : " +  ADMIN_PW);
		AdminMemberVo vo = null;
		
		vo = sqlSession.selectOne("AdminMemberVo.adminLogin", ADMIN_ID);
		System.out.println(vo);
		
		System.out.println("vo : " + vo);
		
		if(vo.getADMIN_ID().equals(ADMIN_ID) && vo.getADMIN_PW().equals(ADMIN_PW)) {
			System.out.println("DB정보와 일치");
			return true;
		}else {
			System.err.println("DB정보와 불일치");
			return false;
		}
		
	}

	@Override
	public AdminMemberVo loadPosition(String ADMIN_ID) {
		AdminMemberVo getPosition = new AdminMemberVo();
		getPosition = sqlSession.selectOne("AdminMemberVo.getPosition", ADMIN_ID);
		return getPosition;
	}

}
