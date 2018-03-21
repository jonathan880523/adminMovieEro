package com.army.adminMovieEro.movieAddList.model.dao;

import java.util.List;

import com.army.adminMovieEro.movieAddList.model.vo.MovieAddListVo;

public interface MovieAddListDao {
	
	public void insertMovie(MovieAddListVo vo) throws Exception;
	
	public void deleteMovie(MovieAddListVo vo) throws Exception;
	
	public List<MovieAddListVo> listMovies() throws Exception; 
}
