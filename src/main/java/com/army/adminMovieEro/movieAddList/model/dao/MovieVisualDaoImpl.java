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
	public void insertStillcut(Map<String, String> stillcutMap) {
		System.out.println("Dao insertStillcut 실행...............");
		sqlSession.insert("MovieVisual.insertStillcut",stillcutMap);
	}

	@Override
	public void insertTrailer(Map<String, String> trailerMap) {
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
