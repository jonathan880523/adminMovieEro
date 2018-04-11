package com.army.adminMovieEro.theaterAddList.model.service;

import java.util.ArrayList;

import com.army.adminMovieEro.theaterAddList.model.vo.theaterImageVo;
import com.army.adminMovieEro.theaterAddList.model.vo.theaterVO;

public interface theaterService {

	public ArrayList<theaterVO> selectList();
	
	public ArrayList<theaterImageVo> selectImage();
	
	public int insertBoard(theaterVO b);
	
	public int insertImage(theaterImageVo b);
	
	public int updateBoard(theaterVO b);
	
	public int deleteBoard(int boardNum);
	
	public int deleteBoard(String image);
	
	public ArrayList<theaterImageVo> selectImage(int bnum);
}
