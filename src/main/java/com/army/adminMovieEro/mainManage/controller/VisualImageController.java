package com.army.adminMovieEro.mainManage.controller;


import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.army.adminMovieEro.mainManage.model.service.VisualImageService;
import com.army.adminMovieEro.mainManage.model.vo.VisualImageVO;

@Controller
public class VisualImageController {

	private static final Logger logger = LoggerFactory.getLogger(VisualImageController.class);
	
	/********* 메인 이미지 관리 ********/

	@Inject
	private VisualImageService visualImageService;
		
	// 목록
	@RequestMapping(value="visualList.do")
	public String mainManageListPage(Model model) throws Exception {
		model.addAttribute("listVO", visualImageService.listAll());
		
		return "mainManage/visual_list";
	}
	
	// 상세
	@RequestMapping(value="visualView.do", method = RequestMethod.GET)
	public String mainManageViewPage(@RequestParam("img_no") int img_no, Model model) throws Exception {
		model.addAttribute("visualImageVO", visualImageService.read(img_no));
		
		return "mainManage/visual_view";
	}
	
	// 삭제
	@RequestMapping(value="visualDel.do", method = RequestMethod.POST)
	public String mainManageDelPage(@RequestParam("img_no") int img_no, RedirectAttributes ra) throws Exception {
		visualImageService.remove(img_no);
		
		ra.addFlashAttribute("msg", "삭제");
		
		return "redirect:visualList.do";
	}
	
	// 글수정 페이지 이동
	@RequestMapping(value="visualModi.do", method = RequestMethod.GET)
	public String mainManageModiGet(int img_no, Model model) throws Exception {
		model.addAttribute("visualImageVO", visualImageService.read(img_no));
		return "mainManage/visual_modi";
	}
	
	// 수정 후 리스트로
	@RequestMapping(value="visualModi.do", method = RequestMethod.POST)
	public String mainManageModiPage(VisualImageVO vo, RedirectAttributes ra) throws Exception {
		visualImageService.modify(vo);
		
		ra.addFlashAttribute("msg", "수정");
		
		return "redirect:visualList.do";
	}
	
	// 글등록 페이지 이동
	@RequestMapping(value="visualWrite.do", method = RequestMethod.GET)
	public String mainManageWriteGet() throws Exception {
		//logger.info("....visualWrite.do의 get.....");
		return "mainManage/visual_write";
	}
	
	// 등록 후 리스트로
	@RequestMapping(value="visualWrite.do", method = RequestMethod.POST)
	public String mainManageWritePost(VisualImageVO vo, RedirectAttributes ra) throws Exception {
		//logger.info(".....visualWrite.do의 POST.....");
		
		visualImageService.regist(vo);
		
		ra.addFlashAttribute("msg", "등록");
		
		return "redirect:visualList.do";
	}

}
