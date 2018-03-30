package com.army.adminMovieEro.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * Handles requests for the application home page.
 */
@Controller
public class LoginController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@RequestMapping(value="/")
	public String home() {
		logger.info("LoginController 도착.......................");
		
		return "main/login";
	}
	
	/*@RequestMapping(value="login.do")
	public ModelAndView home(HttpServletRequest request, ModelAndView mv) {
		logger.info("LoginController 도착.......................");
		
		String ADMIN_ID = request.getParameter("adminId");
		String ADMIN_PW = request.getParameter("adminPw");
		
		System.out.println("adminId = " + ADMIN_ID);
		System.out.println("adminPw = " + ADMIN_PW);
		
		boolean checkId =  loginService.checkId(ADMIN_ID, ADMIN_PW);
		
		if(checkId) {
			mv.setViewName("movieBoard/movieList");
		}else {
			mv.setViewName("main/login");
		}
		
		return mv;
	}*/
	
	
}
