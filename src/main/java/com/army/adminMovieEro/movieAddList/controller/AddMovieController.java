package com.army.adminMovieEro.movieAddList.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AddMovieController {
	
	@Autowired 
	
	
	
	public static final Logger logger = LoggerFactory.getLogger(AddMovieController.class);
	
	@RequestMapping(value="addMovie.do")
	public String goAddMovie() {
		
		logger.info("addMovie.do 도착...............");
		
		return "movieBoard/addMovie";
	}
	
}