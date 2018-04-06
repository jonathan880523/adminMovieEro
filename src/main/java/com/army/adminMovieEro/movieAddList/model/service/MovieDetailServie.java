package com.army.adminMovieEro.movieAddList.model.service;

import java.util.List;

import com.army.adminMovieEro.movieAddList.model.vo.MovieDetailVo;

public interface MovieDetailServie {
	public int addMovieDetail(List<MovieDetailVo> MovieDetailInfo);

	public List<MovieDetailVo> loadMovieDetail();
}
