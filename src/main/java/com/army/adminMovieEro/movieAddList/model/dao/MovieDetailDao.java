package com.army.adminMovieEro.movieAddList.model.dao;

import java.util.List;
import java.util.Map;

import com.army.adminMovieEro.movieAddList.model.vo.MovieDetailVo;

public interface MovieDetailDao {
	public int addMovieDetail(Map<String, String> MovieDetailMap);

	public List<MovieDetailVo> loadMovieDetail();
	public void deleteMovieDetail(String movieUniNum);
}