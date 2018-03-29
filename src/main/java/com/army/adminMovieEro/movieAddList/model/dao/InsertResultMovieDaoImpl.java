package com.army.adminMovieEro.movieAddList.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("insertResultMovieDao")
public class InsertResultMovieDaoImpl implements InsertResultMovieDao {

	@Autowired SqlSession sqlSession;
	
	@Override
	public void insertResultMovie(Map<String, String> resultMap) {
		System.out.println("insertResultMovieDao 도착...................");
		System.out.println("넘어온 값의 갯수" + resultMap.size());
		System.out.println("영화 감독 : " + resultMap.get("resultDirector"));
		sqlSession.insert("InsertResultMovie.insertResultMovie", resultMap);
	}

}