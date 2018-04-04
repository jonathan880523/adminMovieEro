package com.army.adminMovieEro.theaterAddList.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.army.adminMovieEro.theaterAddList.model.vo.theaterVO;

@Repository("theaterDaoImpl")
public class theaterDaoImpl implements theaterDao {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public ArrayList<theaterVO> selectList() {
		// TODO Auto-generated method stub
		return new ArrayList<theaterVO>(sqlSession.selectList("TheaterVo.selectList"));
	}

	@Override
	public theaterVO selectBoard(int boardNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertBoard(theaterVO b) {
		// TODO Auto-generated method stub
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
	public int getListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

}
