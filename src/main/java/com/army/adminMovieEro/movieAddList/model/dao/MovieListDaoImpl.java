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
		List<MovieListVo> movieList = new ArrayList<MovieListVo>();
		
		movieList = sqlSession.selectList("MovieListVo.loadMovieList");
		System.out.println("불러온 영화 제목 : " + movieList.get(3).getTITLE());
		System.out.println("불러온 seq : " + movieList.get(3).getMOVIE_INFO_SEQ());
		return movieList;
	}

	@Override
	public void deleteMovie(String title, String director) {
		
	}

}
