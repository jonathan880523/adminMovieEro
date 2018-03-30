package com.army.adminMovieEro.movieAddList.model.service;

import java.util.List;

import com.army.adminMovieEro.movieAddList.model.vo.MovieListVo;

public interface MovieListService {
	public List<MovieListVo> loadMovieList();
	public void deleteMovie(String title, String director);
}