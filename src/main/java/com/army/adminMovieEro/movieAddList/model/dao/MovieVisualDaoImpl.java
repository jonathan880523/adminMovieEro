package com.army.adminMovieEro.movieAddList.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.army.adminMovieEro.movieAddList.model.vo.MovieVisualVo;

@Repository("movieVisualDao")
public class MovieVisualDaoImpl implements MovieVisualDao {
	
	@Autowired SqlSession sqlSession;

	@Override
	public int insertStillcut(MovieVisualVo visualVo) {
		System.out.println("Dao insertStillcut 실행...............");
		int insertStillcutResult = sqlSession.insert("MovieVisual.insertStillcut",visualVo);
		System.out.println(insertStillcutResult + "개 입력 성공");
		return insertStillcutResult;
	}

	@Override
	public int insertTrailer(MovieVisualVo vo) {
		return 0;
	}

	@Override
	public List<MovieVisualVo> loadVisualItems(int numMOVIE_INFO_SEQ) {
		System.out.println("Dao loadMovieItems 실행.....................");
		List<MovieVisualVo> movieVisualList = sqlSession.selectList("MovieVisual.loadVisualItems", numMOVIE_INFO_SEQ);
			return movieVisualList;
	}

	@Override
	public MovieVisualVo loadLastItem(String MOVIE_STILLCUT) {
		MovieVisualVo movieVo = sqlSession.selectOne("MovieVisual.loadLastItem", MOVIE_STILLCUT);
		return movieVo;
	}

}
