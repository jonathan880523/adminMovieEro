package com.army.adminMovieEro.movieAddList.model.dao;

import java.util.List;

import com.army.adminMovieEro.movieAddList.model.vo.MovieReviewVo;

public interface MovieReviewDao {
	public List<MovieReviewVo> searchReview(String MVTitle);
	public List<MovieReviewVo> loadReview();
	public int deleteReview(int reviewSeq);
}
