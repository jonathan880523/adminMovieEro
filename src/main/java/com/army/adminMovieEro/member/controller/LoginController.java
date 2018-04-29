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

import com.army.adminMovieEro.member.model.vo.AdminMemberVo;

@Controller
public class LoginController {
	
	@Autowired com.army.adminMovieEro.member.model.service.loginService loginService;
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@RequestMapping(value="/")
	public String logIn() {
		logger.info("첫 페이지 도착.......................");
		return "main/login";
	}
	
	@RequestMapping(value="logOut.do")
	public String logOut(HttpSession session) {
		System.out.println("controller logOut.do 도착....................");
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value = "makeAdminId.do") 
	public String makeAdminId() {
		logger.info("controller makeAdminId.do 도착................");
		
		return "/main/makeAdminId";
	}
	
	@RequestMapping(value="login.do", method=RequestMethod.GET)
	public ModelAndView home(HttpServletRequest request, ModelAndView mv, HttpSession session) {
		logger.info("controller login.do 도착.......................");
		AdminMemberVo adminVo = new AdminMemberVo();
		String adminId = request.getParameter("adminId");
		String adminPw = request.getParameter("adminPw");
		
		adminVo = loginService.loadPosition(adminId);
		
		boolean checkStatus =  loginService.checkAdmin(adminId, adminPw);
		System.out.println("checkStatus : " + checkStatus);
		if(checkStatus) {
			session.setAttribute("adminId", adminId);
			session.setAttribute("getPosition", adminVo.getPOSITION());
			System.out.println("session : " + session.getAttribute("adminId"));
			mv.addObject("adminId",session).setViewName("redirect:main.do");
			return mv;
		}else {
			session.invalidate();
			mv.setViewName("redirect:/");
			return mv;
		}
	}
}