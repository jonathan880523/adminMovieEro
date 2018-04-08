package com.army.adminMovieEro.theaterAddList.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.army.adminMovieEro.theaterAddList.model.dao.theaterDaoImpl;
import com.army.adminMovieEro.theaterAddList.model.vo.theaterImageVo;
import com.army.adminMovieEro.theaterAddList.model.vo.theaterVO;

@Service("theaterServiceImpl")
public class theaterServiceImpl implements theaterService {
	
	@Autowired theaterDaoImpl theaterServiceImpl;
	
	@Override
	public ArrayList<theaterVO> selectList() {
		// TODO Auto-generated method stub
		return theaterServiceImpl.selectList();
	}

	@Override
	public theaterVO selectBoard(int boardNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertBoard(theaterVO b) {
		// TODO Auto-generated method stub
		return theaterServiceImpl.insertBoard(b);
	}

	@Override
	public int updateBoard(theaterVO b) {
		// TODO Auto-generated method stub
		return theaterServiceImpl.updateBoard(b);
	}

	@Override
	public int deleteBoard(int boardNum) {
		// TODO Auto-generated method stub
		return theaterServiceImpl.deleteBoard(boardNum);
	}

	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return theaterServiceImpl.getListCount();
	}

	@Override
	public int insertImage(theaterImageVo b) {
		// TODO Auto-generated method stub
		return theaterServiceImpl.insertImage(b);
	}

	@Override
	public ArrayList<theaterImageVo> selectImage() {
		return theaterServiceImpl.selectImage();
	}

	@Override
	public int deleteBoard(String image) {
		// TODO Auto-generated method stub
		return theaterServiceImpl.deleteBoard(image);
	}

}
