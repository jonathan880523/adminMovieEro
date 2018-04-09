package com.army.adminMovieEro.movieAddList.model.dao;

import java.util.List;
import java.util.Map;

import com.army.adminMovieEro.movieAddList.model.vo.MovieVisualVo;

public interface MovieVisualDao {
	public void insertStillcut(Map<String, String> stillcutMap);
	
	public void insertTrailer(Map<String, String> trailerMap);
	
	public List<MovieVisualVo> loadStillcut(String MVInfoSeq);
	
	public List<MovieVisualVo> loadTrailer(String MVInfoSeq);
}
