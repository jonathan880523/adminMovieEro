package com.army.adminMovieEro.mainManage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoxOfficeController {

	// 박스오피스 관리
	@RequestMapping(value="boxOfficeList.do")
	public String boxOfficePage() {
		
		return "mainManage/boxOffice_list";
	}
		
	@RequestMapping(value="boxOfficeView.do")
	public String boxOfficeViewPage() {
		
		return "mainManage/boxOffice_view";
	}
	
	@RequestMapping(value="boxOfficeModi.do")
	public String boxOfficeModiPage() {
		
		return "mainManage/boxOffice_modi";
	}
	
	@RequestMapping(value="boxOfficeWrite.do")
	public String boxOfficeWritePage() {
		
		return "mainManage/boxOffice_write";
	}	
	
}
