package com.army.adminMovieEro.theaterAddList.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.army.adminMovieEro.theaterAddList.model.dao.theaterDaoImpl;
import com.army.adminMovieEro.theaterAddList.model.vo.theaterImageVo;
import com.army.adminMovieEro.theaterAddList.model.vo.theaterVO;

@Service("theaterServiceImpl")
public class theaterServiceImpl implements theaterService {
	
	@Autowired 
	private theaterDaoImpl theaterDaoImpl;
	
	@Override
	public ArrayList<theaterVO> selectList() {
		return theaterDaoImpl.selectList();
	}

	@Override
	public int insertBoard(theaterVO b) {
		return theaterDaoImpl.insertBoard(b);
	}

	@Override
	public int updateBoard(theaterVO b) {
		return theaterDaoImpl.updateBoard(b);
	}

	@Override
	public int deleteBoard(int boardNum) {
		return theaterDaoImpl.deleteBoard(boardNum);
	}


	@Override
	public int insertImage(theaterImageVo b) {
		return theaterDaoImpl.insertImage(b);
	}

	@Override
	public ArrayList<theaterImageVo> selectImage() {
		return theaterDaoImpl.selectImage();
	}

	@Override
	public int deleteBoard(String image) {
		return theaterDaoImpl.deleteBoard(image);
	}

	@Override
	public ArrayList<theaterImageVo> selectImage(int bnum) {
		return theaterDaoImpl.selectImage(bnum);
	}

}
