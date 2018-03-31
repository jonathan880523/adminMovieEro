package com.army.adminMovieEro.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


/**
 * Handles requests for the application home page.
 */
@Controller
public class LoginController {
	
	@Autowired com.army.adminMovieEro.member.model.service.loginService loginService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@RequestMapping(value="/")
	public String home() {
		logger.info("LoginController 도착.......................");
		
		return "main/login";
	}
	
	@RequestMapping(value="login.do", method=RequestMethod.GET)
	public String home(HttpServletRequest request, ModelAndView mv) {
		logger.info("LoginController 도착.......................");
		
		String ADMIN_ID = request.getParameter("adminId");
		String ADMIN_PW = request.getParameter("adminPw");
		
		System.out.println("adminId = " + ADMIN_ID);
		System.out.println("adminPw = " + ADMIN_PW);
		
		boolean checkStatus =  loginService.checkAdmin(ADMIN_ID, ADMIN_PW);
		
		if(checkStatus) {
			return "redirect:loadMovie.do";
		}else {
			return "redirect:/";
		}
		
	}
	
	
}
