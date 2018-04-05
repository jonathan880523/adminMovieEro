package com.army.adminMovieEro.theaterAddList.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.army.adminMovieEro.theaterAddList.model.dao.theaterDaoImpl;
import com.army.adminMovieEro.theaterAddList.model.vo.theaterImageVo;
import com.army.adminMovieEro.theaterAddList.model.vo.theaterVO;


@Controller
public class AddTheaterController {

	@Autowired theaterDaoImpl theaterServiceImpl;
	
	
	@RequestMapping("theaterList.do")
	public ModelAndView goMain(ModelAndView mv, theaterVO board) {
		
		ArrayList<theaterVO> theaterlist = theaterServiceImpl.selectList();
		ArrayList<theaterImageVo> theaterImage = theaterServiceImpl.selectImage();
		mv.addObject("theaterlist",theaterlist).addObject("theaterImage",theaterImage).setViewName("theater/theaterList");
		return mv;
	}
	@RequestMapping("addressSearch.do")
	public String goaddress() {
		return "theater/jusoPopup";
	}
	@RequestMapping("addtheater.do")
	public String goAddMovie() {
		return "theater/addtheater";
	}
	
	@RequestMapping("insertTheater.do")
	public ModelAndView addtheater(HttpServletRequest request, ModelAndView mv, theaterVO board)
			throws IOException {
		
		if (theaterServiceImpl.insertBoard(board) > 0) {
		mv.setViewName("redirect:theaterList.do");

		} else {
		mv.addObject("error", "등록실패!");
		}
		return mv;
	}
	@RequestMapping("deledtTheater.do")
	public ModelAndView deleteTheater(ModelAndView mv, HttpServletRequest request, @RequestParam("RENTAL_SERVICE_NO") int boardNum) {
	
	if(theaterServiceImpl.deleteBoard(boardNum)>0) {
		mv.setViewName("redirect:theaterList.do");
	}else {
		mv.addObject("error", "등록실패!");
	}
		return mv;
	}
	 @RequestMapping("theaterFileUpload.do")   
	 public String action(@RequestParam(value = "image", required = false) MultipartFile file,
			 @RequestParam("RENTAL_SERVICE_NO") int bnum,
			 theaterImageVo board) 
			 throws Exception {
		 		System.out.println(file);
		 		try {
		 		 SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		 		 String fileName = file.getOriginalFilename();
		 		 String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
						+ fileName.substring(fileName.lastIndexOf(".") + 1);
			     File f = new File("D:\\workspace\\adminMovieEro\\src\\main\\webapp\\resources\\images\\theater\\"+renameFileName);
			     file.transferTo(f);
			     board.setRENTAL_SERVICE_OIMAGE(fileName);
			     board.setRENTAL_SERVICE_IMAGE(renameFileName);
			     board.setRENTAL_SERVICE_NO(bnum);
			     theaterServiceImpl.insertImage(board);
		 		}catch(IOException e){
		 			e.printStackTrace();
		 		}
			    return "redirect:theaterList.do";
	    }
}