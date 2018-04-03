package com.army.adminMovieEro.movieAddList.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.army.adminMovieEro.movieAddList.model.dao.MovieVisualDao;
import com.army.adminMovieEro.movieAddList.model.vo.MovieVisualVo;

@Service("movieVisualService")
public class MovieVisualServiceImpl implements MovieVisualService {
	
	@Autowired MovieVisualDao movieVisualDao;

	@Override
	public int insertStillcut(MovieVisualVo visualVo) {
		System.out.println("Service insertStillcut 실행.................");
		int insertStillcutResult = movieVisualDao.insertStillcut(visualVo);
		return insertStillcutResult;
	}

	@Override
	public int insertTrailer(MovieVisualVo vo) {
		return 0;
	}

	@Override
	public List<MovieVisualVo> loadVisualItems(int numMOVIE_INFO_SEQ) {
		System.out.println("Service loadVisualItems 실행.................");
		List<MovieVisualVo> movieVisualList = movieVisualDao.loadVisualItems(numMOVIE_INFO_SEQ); 
		return movieVisualList;
	}

	@Override
	public MovieVisualVo loadLastItem(String MOVIE_STILLCUT) {
		MovieVisualVo movieVo = movieVisualDao.loadLastItem(MOVIE_STILLCUT);
		return movieVo;
	}

}
