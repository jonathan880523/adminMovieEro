package com.army.adminMovieEro.movieAddList.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.army.adminMovieEro.movieAddList.model.vo.MovieDetailVo;
import com.army.adminMovieEro.movieAddList.model.vo.MovieListVo;
import com.army.adminMovieEro.movieAddList.model.vo.MovieReviewVo;
import com.army.adminMovieEro.movieAddList.model.vo.MovieVisualVo;

@Repository("movieDao")
public class MovieDaoImpl implements MovieDao {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public void insertResultMovie(Map<String, String> resultMap) {
		System.out.println("insertResultMovieDao 도착...................");
		sqlSession.insert("InsertResultMovie.insertResultMovie", resultMap);
	}

	@Override
	public int addMovieDetail(Map<String, String> MovieDetailMap) {
		System.out.println("Dao addMovieDetail 실행....................");
		int result = sqlSession.insert("MovieInfoDetail.addDetailInfo", MovieDetailMap);
		System.out.println("result : " + result);
		if(result > 0) {
			System.out.println("입력 성공");
		}else {
			System.out.println("입력 실패");
		}
		return result;
	}

	@Override
	public List<MovieDetailVo> loadMovieDetail() {
		System.out.println("Dao loadMovieDetail 실행..........................");
		List<MovieDetailVo> detailResult = new ArrayList<MovieDetailVo>();
		detailResult = sqlSession.selectList("MovieInfoDetail.loadDetailInfo");
		return detailResult;
	}

	@Override
	public void deleteMovieDetail(String movieUniNum) {
		System.out.println("Dao deleteMovieDetail 실행........................");
		sqlSession.delete("MovieInfoDetail.deleteDetailInfo", movieUniNum);
	}

	@Override
	public List<MovieListVo> loadMovieList() {
		System.out.println("Dao MovieList 실행................");
		List<MovieListVo> movieList = new ArrayList<MovieListVo>();
		movieList = sqlSession.selectList("MovieListVo.loadMovieList");
		System.out.println("영화 목록 불러오기 성공");
		return movieList;
	}

	@Override
	public void deleteMovie(String movieUniNum) {
		System.out.println("Dao deleteMovie 실행...................");
		System.out.println("삭제할 유니넘버  : " + movieUniNum);
		sqlSession.delete("MovieListVo.deleteMovie", movieUniNum);
	}

	@Override
	public MovieListVo loadMovieTitle(String numMOVIE_INFO_SEQ) {
		System.out.println("Dao loadMovieTitle 실행................");
		MovieListVo movieVo = new MovieListVo();
		movieVo = sqlSession.selectOne("MovieListVo.loadMovieTitle", numMOVIE_INFO_SEQ);
		System.out.println("movieVo.toString() : " + movieVo.toString());
		return movieVo;
	}

	@Override
	public List<MovieReviewVo> searchReview(String MVTitle) {
		System.out.println("Dao searchReview 실행..............");
		return sqlSession.selectList("Review.searchReviewList", MVTitle);
	}

	@Override
	public List<MovieReviewVo> loadReview() {
		System.out.println("Dao loadReview 실행..................");
		return sqlSession.selectList("Review.loadReviewList");
	}

	@Override
	public List<MovieReviewVo> loadSpecificReview(String MVInfoSeq) {
		System.out.println("Dao loadSpecificReview 실행..................");
		return sqlSession.selectList("Review.loadSpecificReviewList", MVInfoSeq);
	}

	@Override
	public int deleteReview(int reviewSeq) {
		System.out.println("Dao deleteReview 실행.................");
		return sqlSession.delete("Review.deleteReview", reviewSeq);
	}

	@Override
	public void insertStillcut(Map<String, String> stillcutMap) {
		System.out.println("Dao insertStillcut 실행...............");
		sqlSession.insert("MovieVisual.insertStillcut",stillcutMap);
		
	}

	@Override
	public void insertTrailer(Map<String, String> trailerMap) {
		System.out.println("Dao insertTrailer 실행...............");
		sqlSession.insert("MovieVisual.insertTrailer",trailerMap);
		
	}

	@Override
	public List<MovieVisualVo> loadStillcut(String MVInfoSeq) {
		System.out.println("Dao loadMovieItems 실행.....................");
		List<MovieVisualVo> movieStillcutList = sqlSession.selectList("MovieVisual.loadStillcut", MVInfoSeq);
		return movieStillcutList;
	}

	@Override
	public List<MovieVisualVo> loadTrailer(String MVInfoSeq) {
		System.out.println("Dao loadMovieItems 실행.....................");
		List<MovieVisualVo> movieTrailerList = sqlSession.selectList("MovieVisual.loadTrailer", MVInfoSeq);
		return movieTrailerList;
	}

	@Override
	public int deleteStillcut(String stillcutSeq) {
		System.out.println("Dao deleteStillcut 실행................");
		int resultDelStillcut = sqlSession.delete("MovieVisual.deleteStillcut", stillcutSeq);
		if(resultDelStillcut > 0) {
			System.out.println("스틸컷 삭제 성공");
		}
		return resultDelStillcut;
	}

	@Override
	public int deleteTrailer(String trailerSeq) {
		System.out.println("Dao deleteTrailer 실행..................");
		int resultDelTrailer = sqlSession.delete("MovieVisual.deleteTrailer", trailerSeq);
		if(resultDelTrailer > 0) {
			System.out.println("트레일러 삭제 성공");
		}
		return resultDelTrailer;
	}
}
