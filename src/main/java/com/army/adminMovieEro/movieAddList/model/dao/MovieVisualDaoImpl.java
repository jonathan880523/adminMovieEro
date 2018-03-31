package com.army.adminMovieEro.movieAddList.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.army.adminMovieEro.movieAddList.model.vo.MovieVisualVo;

@Repository("movieVisualDao")
public class MovieVisualDaoImpl implements MovieVisualDao {
	
	@Autowired SqlSession sqlSession;

	@Override
	public int insertStillcut(MovieVisualVo vo) {
		System.out.println("Dao insertStillcut 실행...............");
		int insertStillcutResult = sqlSession.insert("MovieVisualVo.insertStillcut",vo);
		System.out.println(insertStillcutResult + "개 입력 성공");
		return insertStillcutResult;
	}

	@Override
	public int insertTrailer(MovieVisualVo vo) {
		return 0;
	}

}
