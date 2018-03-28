package com.army.adminMovieEro.movieAddList.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Test {
	@RequestMapping(value="test.do")
	public Map<String, String> testMethod(HttpServletRequest request, ModelMap map) {
		
		String test = request.getParameter("name");
		System.out.println(test);
		String pw = request.getParameter("pw");
		System.out.println(pw);
		
		test += "되니?";
		pw += "되나요?";
		
		Map<String, String> map1 = new HashMap<String, String>();
		
		map1.put("test", test);
		map1.put("pw", pw);
		
		return map1;
	}
}
