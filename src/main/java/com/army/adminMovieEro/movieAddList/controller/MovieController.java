package com.army.adminMovieEro.movieAddList.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MovieController {
	
	private static final Logger logger = LoggerFactory.getLogger(MovieController.class);
	
	@RequestMapping(value="list.do")
	public String loadMovieList() {
		
		logger.info("MovieController 도착 ....................");
		
		return "movieBoard/movieList";
	}
}