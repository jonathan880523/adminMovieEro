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
		movieVisualDao.insertTrailer(trailerMap);
	}

	@Override
	public List<MovieVisualVo> loadStillcut(String MVInfoSeq) {
		System.out.println("Service loadStillcut 실행.................");
		List<MovieVisualVo> movieVisualList = movieVisualDao.loadStillcut(MVInfoSeq); 
		return movieVisualList;
	}

	@Override
	public List<MovieVisualVo> loadTrailer(String MVInfoSeq) {
		System.out.println("Service loadTrailer 실행.................");
		List<MovieVisualVo> movieVisualList = movieVisualDao.loadTrailer(MVInfoSeq); 
		return movieVisualList;
	}

	@Override
	public void deleteStillcut(String stillcutSeq) {
		System.out.println("Service deleteStillcut 실행.............");
		movieVisualDao.deleteStillcut(stillcutSeq);
	}

	@Override
	public void deleteTrailer(String trailerSeq) {
		System.out.println("Service deleteTrailer 실행...............");
		movieVisualDao.deleteTrailer(trailerSeq);
	}

}
