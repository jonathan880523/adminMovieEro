package com.army.adminMovieEro.movie.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.army.adminMovieEro.movie.model.dao.MovieDao;
import com.army.adminMovieEro.movie.model.vo.MovieDetailVo;
import com.army.adminMovieEro.movie.model.vo.MovieListVo;
import com.army.adminMovieEro.movie.model.vo.MovieReviewVo;
import com.army.adminMovieEro.movie.model.vo.MovieVisualVo;

@Service("movieService")
public class MovieServiceImpl implements MovieService {

	@Autowired
	MovieDao movieDao;

	@Override
	public void insertResultMovie(Map<String, String> resultMap) {
		System.out.println("insertResultMovieService 도착...................");
		movieDao.insertResultMovie(resultMap);
	}

	@Override
	public int addMovieDetail(Map<String, String> movieDetailMap) {
		System.out.println("Service addMovieDetail 실행..................");
		return movieDao.addMovieDetail(movieDetailMap);
	}

	@Override
	public List<MovieDetailVo> loadMovieDetail() {
		System.out.println("Service loadMovieDetail 실행....................");
		List<MovieDetailVo> detailResult = movieDao.loadMovieDetail();
		return detailResult;
	}

	@Override
	public void deleteMovieDetail(String movieUniNum) {
		System.out.println("Service deleteMovieDetail 실행............");
		movieDao.deleteMovieDetail(movieUniNum);
	}

	@Override
	public List<MovieListVo> loadMovieList() {
		System.out.println("Service loadMovieList 실행..................");
		List<MovieListVo> movieList = movieDao.loadMovieList();
		return movieList;
	}

	@Override
	public void deleteMovie(String movieUniNum) {
		System.out.println("Service deleteMovieService 실행..........................");
		movieDao.deleteMovie(movieUniNum);
	}

	@Override
	public MovieListVo loadMovieTitle(String numMOVIE_INFO_SEQ) {
		System.out.println("Service loadMovieTitle 실행..................");
		MovieListVo movieVo = movieDao.loadMovieTitle(numMOVIE_INFO_SEQ);
		return movieVo;
	}

	@Override
	public List<MovieReviewVo> searchReview(String searchOption, String searchValue) {
		System.out.println("Service searchReview 실행................");
		return movieDao.searchReview(searchOption, searchValue);
	}

	@Override
	public List<MovieReviewVo> loadReview() {
		System.out.println("Service loadReview 실행.................");
		return movieDao.loadReview();
	}

	@Override
	public List<MovieReviewVo> loadSpecificReview(String MVInfoSeq) {
		System.out.println("Service loadSpecificReview 실행.................");
		return movieDao.loadSpecificReview(MVInfoSeq);
	}

	@Override
	public boolean deleteReview(int reviewSeq) {
		System.out.println("deleteReview 실행....................");
		int resultDeleteReviewCnt = movieDao.deleteReview(reviewSeq);
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
	public void insertStillcut(Map<String, String> stillcutMap) {
		System.out.println("Service insertStillcut 실행.................");
		movieDao.insertStillcut(stillcutMap);
	}

	@Override
	public void insertTrailer(Map<String, String> trailerMap) {
		System.out.println("Service insertTrailer 실행.................");
		movieDao.insertTrailer(trailerMap);
	}

	@Override
	public List<MovieVisualVo> loadStillcut(String MVInfoSeq) {
		System.out.println("Service loadStillcut 실행.................");
		List<MovieVisualVo> movieVisualList = movieDao.loadStillcut(MVInfoSeq); 
		return movieVisualList;
	}

	@Override
	public List<MovieVisualVo> loadTrailer(String MVInfoSeq) {
		System.out.println("Service loadTrailer 실행.................");
		List<MovieVisualVo> movieVisualList = movieDao.loadTrailer(MVInfoSeq); 
		return movieVisualList;
	}

	@Override
	public void deleteStillcut(String stillcutSeq) {
		System.out.println("Service deleteStillcut 실행.............");
		movieDao.deleteStillcut(stillcutSeq);
	}

	@Override
	public void deleteTrailer(String trailerSeq) {
		System.out.println("Service deleteTrailer 실행...............");
		movieDao.deleteTrailer(trailerSeq);
	}
}
