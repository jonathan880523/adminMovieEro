package com.army.adminMovieEro.mainManage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class mainManageController {

	@RequestMapping(value="mainManage.do")
	public String mainManagePage() {
		
		return "mainManage/mm_index";
	}
	
	@RequestMapping(value="boxOffice.do")
	public String boxOfficePage() {
		
		return "mainManage/mm_boxOffice";
	}
}
