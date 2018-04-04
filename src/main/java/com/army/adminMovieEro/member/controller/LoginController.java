package com.army.adminMovieEro.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
	
	@Autowired com.army.adminMovieEro.member.model.service.loginService loginService;
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@RequestMapping(value="/")
	public String home() {
		logger.info("LoginController 도착.......................");
		return "main/login";
	}
	
	@RequestMapping(value="logOut.do")
	public String logOut(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value="login.do", method=RequestMethod.GET)
	public ModelAndView home(HttpServletRequest request, ModelAndView mv, HttpSession session) {
		logger.info("LoginController 도착.......................");
		
		String adminId = request.getParameter("adminId");
		String adminPw = request.getParameter("adminPw");
		
		System.out.println("adminId = " + adminId);
		System.out.println("adminPw = " + adminPw);
		
		boolean checkStatus =  loginService.checkAdmin(adminId, adminPw);
		if(checkStatus) {
			session.setAttribute("adminId", adminId);
			System.out.println("session : " + session.getAttribute("adminId"));
			mv.addObject("ADMIN_ID",session).setViewName("redirect:main.do");
			return mv;
		}else {
			session.invalidate();
			mv.setViewName("redirect:/");
			return mv;
		}
	}
}