package com.army.adminMovieEro.mainManage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class mainManageController {
	
	// 메인 이미지 관리
	@RequestMapping(value="visualList.do")
	public String mainManageListPage() {
		
		return "mainManage/visual_list";
	}
	
	@RequestMapping(value="visualView.do")
	public String mainManageViewPage() {
		
		return "mainManage/visual_view";
	}
	
	@RequestMapping(value="visualModi.do")
	public String mainManageModiPage() {
		
		return "mainManage/visual_modi";
	}
	
	@RequestMapping(value="visualWrite.do")
	public String mainManageWritePage() {
		
		return "mainManage/visual_write";
	}
	
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
