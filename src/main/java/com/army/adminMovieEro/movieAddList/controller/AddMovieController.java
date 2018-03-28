package com.army.adminMovieEro.movieAddList.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AddMovieController {
	
	public static final Logger logger = LoggerFactory.getLogger(AddMovieController.class);
	
	@RequestMapping(value="addMovie.do")
	public String goAddMovie() {
		
		logger.info("AddMovieController 도착...............");
		
		return "movieBoard/addMovie";
	}
}