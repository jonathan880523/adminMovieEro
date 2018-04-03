package com.army.adminMovieEro.movieAddList.model.dao;

import java.util.List;
import java.util.Map;

import com.army.adminMovieEro.movieAddList.model.vo.MovieVisualVo;

public interface MovieVisualDao {
	public int insertStillcut(MovieVisualVo visualVo);
	public int insertTrailer(MovieVisualVo vo);
	public List<MovieVisualVo> loadVisualItems(int numMOVIE_INFO_SEQ);
	public MovieVisualVo loadLastItem(String MOVIE_STILLCUT);
}
