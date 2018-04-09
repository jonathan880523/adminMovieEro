package com.army.adminMovieEro.movieAddList.model.service;

import java.util.List;
import java.util.Map;

import com.army.adminMovieEro.movieAddList.model.vo.MovieVisualVo;

public interface MovieVisualService {

	public void insertStillcut(Map<String, String> stillcutMap);
	
	public void insertTrailer(Map<String, String> trailerMap);
	
	public List<MovieVisualVo> loadStillcut(String MVInfoSeq);
	
	public List<MovieVisualVo> loadTrailer(String MVInfoSeq);
	
	public void deleteStillcut(String stillcutSeq);
	
	public void deleteTrailer(String trailerSeq);
	
	
}
