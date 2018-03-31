package com.army.adminMovieEro.movieAddList.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.army.adminMovieEro.movieAddList.model.dao.DeleteMovieDao;

@Service("deleteMovieService")
public class DeleteMovieServiceImpl implements DeleteMovieService {

	@Autowired DeleteMovieDao deleteMovieDao;
	
	@Override
	public int deleteMovie(int movieUniNum) {
		return 0;
	}

}
