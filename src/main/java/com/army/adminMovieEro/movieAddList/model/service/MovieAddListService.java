package com.army.adminMovieEro.movieAddList.model.service;

import java.util.List;

import com.army.adminMovieEro.movieAddList.model.vo.MovieAddListVo;

public interface MovieAddListService {
	public void registMovie(MovieAddListVo vo) throws Exception;
	
	public void removeMovie(MovieAddListVo vo) throws Exception;
	
	public List<MovieAddListVo> listMovies() throws Exception;
}