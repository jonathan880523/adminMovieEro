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
	
	@Override
	public boolean deleteReview(int reviewSeq){
		System.out.println("deleteReview 실행....................");
		int resultDeleteReviewCnt = movieReviewDao.deleteReview(reviewSeq);
		boolean resultDeleteReview = false;
		if(resultDeleteReviewCnt > 0){
			resultDeleteReview = true;
			return resultDeleteReview;
		}else{
			resultDeleteReview = false;
			return resultDeleteReview;
		}
		
	}

	@Override
	public List<MovieReviewVo> loadSpecificReview(String MVInfoSeq) {
		System.out.println("Service loadSpecificReview 실행.................");
		return movieReviewDao.loadSpecificReview(MVInfoSeq);
	};

}
