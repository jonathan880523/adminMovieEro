package com.army.adminMovieEro.movieAddList.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.army.adminMovieEro.movieAddList.model.vo.MovieAddListVo;

@Repository
public class MovieAddListDaoImpl implements MovieAddListDao {

	@Inject
	private SqlSession session;
	
	private static String namespace = "MovieAddListVo";
	
	@Override
	public void insertMovie(MovieAddListVo vo) throws Exception {
		session.insert(namespace + ".insertMovie", vo);
	}

	@Override
	public void deleteMovie(MovieAddListVo vo) throws Exception {
		session.delete(namespace + ".deleteMovie", vo);
	}

	@Override
	public List<MovieAddListVo> listMovies() throws Exception {
		return session.selectList(namespace + ".listMovies");
	}

}
