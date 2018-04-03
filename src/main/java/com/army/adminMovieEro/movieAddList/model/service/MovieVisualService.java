package com.army.adminMovieEro.movieAddList.model.service;

import java.util.List;

import com.army.adminMovieEro.movieAddList.model.vo.MovieVisualVo;

public interface MovieVisualService {

	public int insertStillcut(MovieVisualVo visualVo);
	
	public int insertTrailer(MovieVisualVo vo);
	
	public List<MovieVisualVo> loadVisualItems(int numMOVIE_INFO_SEQ);
	
	public MovieVisualVo loadLastItem(String MOVIE_STILLCUT);
}
