package com.army.adminMovieEro.movieAddList.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.army.adminMovieEro.movieAddList.model.dao.MovieReviewDao;
import com.army.adminMovieEro.movieAddList.model.vo.MovieReviewVo;

@Service("movieReviewService")
public class MovieReviewServiceImpl implements MovieReviewService {

	@Autowired MovieReviewDao movieReviewDao;
	
	@Override
	public List<MovieReviewVo> searchReview(String MVTitle) {
		System.out.println("Service searchReview 실행................");
		return movieReviewDao.searchReview(MVTitle);
	}

	@Override
	public List<MovieReviewVo> loadReview() {
		System.out.println("Service loadReview 실행.................");
		
		return movieReviewDao.loadReview();
	}

}
