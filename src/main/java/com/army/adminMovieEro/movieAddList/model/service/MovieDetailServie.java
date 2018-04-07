package com.army.adminMovieEro.movieAddList.model.service;

import java.util.List;
import java.util.Map;

import com.army.adminMovieEro.movieAddList.model.vo.MovieDetailVo;

public interface MovieDetailServie {
	public int addMovieDetail(Map<String, String> movieDetailMap);

	public List<MovieDetailVo> loadMovieDetail();
	public void deleteMovieDetail(String movieUniNum);
}
