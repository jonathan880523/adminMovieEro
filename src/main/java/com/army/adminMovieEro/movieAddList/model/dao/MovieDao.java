package com.army.adminMovieEro.movieAddList.model.dao;

import java.util.List;
import java.util.Map;

import com.army.adminMovieEro.movieAddList.model.vo.MovieDetailVo;
import com.army.adminMovieEro.movieAddList.model.vo.MovieListVo;
import com.army.adminMovieEro.movieAddList.model.vo.MovieReviewVo;
import com.army.adminMovieEro.movieAddList.model.vo.MovieVisualVo;

public interface MovieDao {
	public void insertResultMovie(Map<String, String> resultMap);
	
	public int addMovieDetail(Map<String, String> MovieDetailMap);

	public List<MovieDetailVo> loadMovieDetail();
	
	public void deleteMovieDetail(String movieUniNum);
	
	public List<MovieListVo> loadMovieList();
	
	public void deleteMovie(String movieUniNum);
	
	public MovieListVo loadMovieTitle(String numMOVIE_INFO_SEQ);
	
	public List<MovieReviewVo> searchReview(String MVTitle);
	
	public List<MovieReviewVo> loadReview();
	
	public List<MovieReviewVo> loadSpecificReview(String MVInfoSeq);
	
	public int deleteReview(int reviewSeq);
	
	public void insertStillcut(Map<String, String> stillcutMap);
	
	public void insertTrailer(Map<String, String> trailerMap);
	
	public List<MovieVisualVo> loadStillcut(String MVInfoSeq);
	
	public List<MovieVisualVo> loadTrailer(String MVInfoSeq);
	
	public int deleteStillcut(String stillcutSeq);
	
	public int deleteTrailer(String trailerSeq);
}
