package com.army.adminMovieEro.theaterAddList.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AddTheaterController {

	@RequestMapping(value="/theaterList.do")
	public String goMain() {
		return "theater/theaterList";
	}
	@RequestMapping(value="/addressSearch.do")
	public String goaddress() {
		return "theater/jusoPopup";
	}
	@RequestMapping(value = "addtheater.do")
	public String goAddMovie() {


		return "theater/addtheater";
	}
}
