package com.army.adminMovieEro.movieAddList.model.dao;

import java.util.List;

import com.army.adminMovieEro.movieAddList.model.vo.MovieDetailVo;

public interface MovieDetailDao {
	public int addMovieDetail(List<MovieDetailVo> MovieDetailInfo);

	public List<MovieDetailVo> loadMovieDetail();
}