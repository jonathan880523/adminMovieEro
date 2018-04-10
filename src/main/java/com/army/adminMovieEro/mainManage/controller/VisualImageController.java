package com.army.adminMovieEro.mainManage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class VisualImageController {

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

}
