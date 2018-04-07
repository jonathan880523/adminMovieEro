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
	public void insertStillcut(Map<String, String> stillcutMap) {
		System.out.println("Service insertStillcut 실행.................");
		movieVisualDao.insertStillcut(stillcutMap);
	}

	@Override
	public void insertTrailer(Map<String, String> trailerMap) {
		System.out.println("Service insertTrailer 실행.................");
		movieVisualDao.insertStillcut(trailerMap);
	}

	@Override
	public List<MovieVisualVo> loadVisualItems(String MVInfoSeq) {
		System.out.println("Service loadVisualItems 실행.................");
		List<MovieVisualVo> movieVisualList = movieVisualDao.loadVisualItems(MVInfoSeq); 
		return movieVisualList;
	}

}
