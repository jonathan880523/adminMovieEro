package com.army.adminMovieEro.test.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MultipartTestController {
	
	public static final Logger logger = LoggerFactory.getLogger(MultipartTestController.class);
	
	@RequestMapping(value="/uploadPage.do")
	public String goUploadPage() {
		return "movieBoard/multipartTest";
	}
	
	@RequestMapping(value="/uploadForm", method = RequestMethod.GET)
	public void uploadForm(MultipartFile file, ModelAndView mv) throws Exception {
		
		logger.info("originalName: " + file.getOriginalFilename());
		logger.info("size: " + file.getSize());
		logger.info("contentType: " + file.getContentType());
		
	}
}
