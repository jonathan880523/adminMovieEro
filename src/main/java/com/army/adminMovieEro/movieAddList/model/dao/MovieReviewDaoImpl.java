package com.army.adminMovieEro.movieAddList.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.army.adminMovieEro.movieAddList.model.vo.MovieReviewVo;

@Repository("movieReviewDao")
public class MovieReviewDaoImpl implements MovieReviewDao {

	@Autowired SqlSession sqlSession;
	
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
	public int deleteReview(int reviewSeq){
		System.out.println("Dao deleteReview 실행.................");
		return sqlSession.delete("Review.deleteReview", reviewSeq);
	}

	@Override
	public List<MovieReviewVo> loadSpecificReview(String MVInfoSeq) {
		System.out.println("Dao loadSpecificReview 실행..................");
		return sqlSession.selectList("Review.loadSpecificReviewList", MVInfoSeq);
	}

}
