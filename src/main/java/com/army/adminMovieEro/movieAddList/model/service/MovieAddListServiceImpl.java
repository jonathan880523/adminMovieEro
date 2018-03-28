package com.army.adminMovieEro.movieAddList.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.army.adminMovieEro.movieAddList.model.dao.MovieAddListDao;
import com.army.adminMovieEro.movieAddList.model.vo.MovieAddListVo;

@Service
public class MovieAddListServiceImpl implements MovieAddListService {
	
	@Autowired
	private MovieAddListDao dao;
	
	@Override
	public void registMovie(MovieAddListVo vo) throws Exception {
		dao.insertMovie(vo);
	}

	@Override
	public void removeMovie(MovieAddListVo vo) throws Exception {
		dao.deleteMovie(vo);
	}

	@Override
	public List<MovieAddListVo> listMovies() throws Exception {
		return dao.listMovies();
	}
}
