package com.army.adminMovieEro.movieAddList.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.army.adminMovieEro.movieAddList.model.dao.MovieVisualDao;
import com.army.adminMovieEro.movieAddList.model.vo.MovieVisualVo;

@Service("movieVisualService")
public class MovieVisualServiceImpl implements MovieVisualService {
	
	@Autowired MovieVisualDao movieVisualDao;

	@Override
	public int insertStillcut(MovieVisualVo vo) {
		System.out.println("Service insertStillcut 실행.................");
		int insertStillcutResult = movieVisualDao.insertStillcut(vo);
		return insertStillcutResult;
	}

	@Override
	public int insertTrailer(MovieVisualVo vo) {
		return 0;
	}

}
