package com.army.adminMovieEro.theaterAddList.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.army.adminMovieEro.theaterAddList.model.vo.theaterImageVo;
import com.army.adminMovieEro.theaterAddList.model.vo.theaterVO;

@Repository("theaterDaoImpl")
public class theaterDaoImpl implements theaterDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<theaterVO> selectList() {
		return new ArrayList<theaterVO>(sqlSession.selectList("TheaterVo.selectList"));
	}


	@Override
	public int insertBoard(theaterVO b) {
		return sqlSession.insert("TheaterVo.insertList",b);
	}

	@Override
	public int updateBoard(theaterVO b) {
		
		return sqlSession.delete("TheaterVo.updateList",b);
	}

	@Override
	public int deleteBoard(int boardNum) {
		return sqlSession.delete("TheaterVo.deledtList",boardNum);
	}


	@Override
	public int insertImage(theaterImageVo b) {
		return sqlSession.insert("TheaterVo.insertImage",b);
	}

	@Override
	public ArrayList<theaterImageVo> selectImage() {
		return new ArrayList<theaterImageVo>(sqlSession.selectList("TheaterVo.selectImage"));
	}

	@Override
	public int deleteBoard(String image) {
		return sqlSession.delete("TheaterVo.deleteImg",image);
	}


	@Override
	public ArrayList<theaterImageVo> selectImage(int bnum) {
		return new ArrayList<theaterImageVo>(sqlSession.selectList("TheaterVo.deleteImage",bnum));
	}

}
