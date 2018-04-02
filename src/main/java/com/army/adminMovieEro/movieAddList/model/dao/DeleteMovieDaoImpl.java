package com.army.adminMovieEro.movieAddList.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("deleteMovieDao")
public class DeleteMovieDaoImpl implements DeleteMovieDao {

	@Autowired
	SqlSession sqlSession;

	@Override
	public int deleteMovie(String movieUniNum) {
		System.out.println("deleteMovieDao 도착...................");

		System.out.println("삭제할 유니넘버  : " + movieUniNum);
		int resultDeleteMovie = sqlSession.delete("MovieListVo.deleteMovie", movieUniNum);

		return resultDeleteMovie;
	}

}
