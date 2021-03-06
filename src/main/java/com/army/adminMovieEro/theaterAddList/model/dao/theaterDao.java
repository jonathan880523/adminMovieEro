package com.army.adminMovieEro.theaterAddList.model.dao;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.RequestMapping;

import com.army.adminMovieEro.theaterAddList.model.vo.theaterImageVo;
import com.army.adminMovieEro.theaterAddList.model.vo.theaterVO;

public interface theaterDao {

	public ArrayList<theaterVO> selectList();
	
	public ArrayList<theaterImageVo> selectImage();
	
	public int insertBoard(theaterVO b);
	
	public int insertImage(theaterImageVo b);
	
	public int updateBoard(theaterVO b);
	
	public int deleteBoard(int boardNum);
	
	public ArrayList<theaterImageVo> selectImage(int bnum);
	
	public int deleteBoard(String image);
	
	
}
