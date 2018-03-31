package com.army.adminMovieEro.movieAddList.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.army.adminMovieEro.movieAddList.model.vo.MovieListVo;

@Repository("MovieListDao")
public class MovieListDaoImpl implements MovieListDao {
	
	@Autowired SqlSession sqlSession;

	@Override
	public List<MovieListVo> loadMovieList() {
		System.out.println("MovieListDao 도착................");
		List<MovieListVo> movieList = new ArrayList<MovieListVo>();
		
		movieList = sqlSession.selectList("MovieListVo.loadMovieList");
		System.out.println("영화 목록 불러오기 성공");
		
		return movieList;
	}

	@Override
	public void deleteMovie(String title, String director) {
		
	}

}
