package com.army.adminMovieEro;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.army.adminMovieEro.member.model.dao.AdminLoginDao;
import com.army.adminMovieEro.member.model.vo.AdminMemberVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file/src/main/webapp/WEB-INF/**/root-context.xml"})
public class LoginTest {

	@Inject
	private AdminLoginDao dao;
	
	private static Logger logger = LoggerFactory.getLogger(LoginTest.class);
	
	@Test
	public void testLogin() throws Exception{
		
		AdminMemberVo vo = new AdminMemberVo();
		logger.info(dao.login(vo));
	}
}
