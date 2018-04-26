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
		System.out.println("DAO loginAdmin 실행 ............");
		AdminMemberVo vo = sqlSession.selectOne("AdminMemberVo.adminLogin", ADMIN_ID);
		
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
