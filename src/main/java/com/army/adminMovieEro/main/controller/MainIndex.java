package com.army.adminMovieEro.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainIndex {

	private static final Logger logger = LoggerFactory.getLogger(MainIndex.class);
	
	@RequestMapping(value="/main.do")
	public String goMain() {
		logger.info("MainIndex 도착....................");
		
		return "main/index";
	}
}