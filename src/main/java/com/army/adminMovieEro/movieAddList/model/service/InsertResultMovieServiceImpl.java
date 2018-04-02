package com.army.adminMovieEro.movieAddList.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.army.adminMovieEro.movieAddList.model.dao.InsertResultMovieDao;

@Service("insertResultMovieService")
public class InsertResultMovieServiceImpl implements InsertResultMovieService {

	@Autowired InsertResultMovieDao insertResultMovieDao;
	
	@Override
	public void insertResultMovie(Map<String, String> resultMap) {
		System.out.println("insertResultMovieService 도착...................");
		insertResultMovieDao.insertResultMovie(resultMap);
	}

}
