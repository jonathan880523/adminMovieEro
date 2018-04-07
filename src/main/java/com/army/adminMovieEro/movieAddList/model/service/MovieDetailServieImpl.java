package com.army.adminMovieEro.movieAddList.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.army.adminMovieEro.movieAddList.model.dao.MovieDetailDao;
import com.army.adminMovieEro.movieAddList.model.vo.MovieDetailVo;

@Service("movieDetailServie")
public class MovieDetailServieImpl implements MovieDetailServie {

	@Autowired
	MovieDetailDao movieDetailDao;
	
	@Override
	public int addMovieDetail(Map<String, String> MovieDetailMap) {
		System.out.println("Service addMovieDetail 실행..................");
		
		return movieDetailDao.addMovieDetail(MovieDetailMap);

	}

	@Override
	public List<MovieDetailVo> loadMovieDetail() {
		System.out.println("Service loadMovieDetail 실행....................");
		List<MovieDetailVo> detailResult = new ArrayList<MovieDetailVo>();
		detailResult = movieDetailDao.loadMovieDetail();
		return detailResult;
	}

	@Override
	public void deleteMovieDetail(String movieUniNum) {
		System.out.println("Service deleteMovieDetail 실행............");
		movieDetailDao.deleteMovieDetail(movieUniNum);
	}

}
