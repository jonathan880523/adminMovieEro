package com.army.adminMovieEro.movieAddList.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.army.adminMovieEro.movieAddList.model.service.InsertResultMovieService;

@Controller
public class InsertResultMovieController {
	
	@Autowired InsertResultMovieService insertResultMovieService;

	public static final Logger logger = LoggerFactory.getLogger(AddMovieController.class);
	
	@RequestMapping(value="insertMovie.do", method=RequestMethod.GET)
	public String insertMovie(HttpServletRequest request) {
		/*List<String> resultList = new ArrayList<String>();
		logger.info("insertMovie.do 도착...................");

		resultList.add(request.getParameter("retsulTitle"));
		resultList.add(request.getParameter("resultSubtitle"));
		resultList.add(request.getParameter("resultDirector"));
		resultList.add(request.getParameter("resultActor"));
		resultList.add(request.getParameter("resultPubDate"));
		resultList.add(request.getParameter("resultUserRating"));
		resultList.add(request.getParameter("resultImage"));
		resultList.add(request.getParameter("resultLink"));
		
		System.out.println("입력된 값의 갯수 : " + resultList.size());*/
		
		Map<String, String> resultMap = new HashMap<String, String>();
		
		resultMap.put("resultTitle", request.getParameter("resultTitle"));
		System.out.println("영화 제목 : " + resultMap.get(0));
		resultMap.put("resultSubtitle", request.getParameter("resultSubtitle"));
		resultMap.put("resultDirector", request.getParameter("resultDirector"));
		System.out.println("영화 감독 : " + resultMap.get("resultDirector"));
		resultMap.put("resultActor", request.getParameter("resultActor"));
		resultMap.put("resultPubDate", request.getParameter("resultPubDate"));
		resultMap.put("resultUserRating", request.getParameter("resultUserRating"));
		System.out.println("네이버 평점 : " + request.getParameter("resultUserRating"));
		resultMap.put("resultImage", request.getParameter("resultImage"));
		resultMap.put("resultLink", request.getParameter("resultLink"));

		System.out.println("입력된 값의 갯수 : " + resultMap.size());
		
		insertResultMovieService.insertResultMovie(resultMap);
		
		return "movieBoard/movieList";
		
	}
}
