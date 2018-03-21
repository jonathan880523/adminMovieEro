package com.army.adminMovieEro.movieAddList.model.service;

import com.army.adminMovieEro.movieAddList.model.vo.MovieAddListVo;

public interface MovieAddListService {
	public void registMovie(MovieAddListVo vo) throws Exception;
	
	public void removeMovie(MovieAddListVo vo) throws Exception;
}
