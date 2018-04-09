package com.army.adminMovieEro.movieAddList.model.dao;

import java.util.List;

import com.army.adminMovieEro.movieAddList.model.vo.MovieListVo;

public interface MovieListDao {
	public List<MovieListVo> loadMovieList();
	public void deleteMovie(String movieUniNum);
	public MovieListVo loadMovieTitle(String numMOVIE_INFO_SEQ);
}
