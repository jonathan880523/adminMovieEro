package com.army.adminMovieEro.movieAddList.model.service;

import java.util.List;

import com.army.adminMovieEro.movieAddList.model.vo.MovieReviewVo;

public interface MovieReviewService {

	public List<MovieReviewVo> searchReview(String MVTitle);
	public List<MovieReviewVo> loadReview();
	public List<MovieReviewVo> loadSpecificReview(String MVInfoSeq);
	public boolean deleteReview(int reviewSeq);
}
