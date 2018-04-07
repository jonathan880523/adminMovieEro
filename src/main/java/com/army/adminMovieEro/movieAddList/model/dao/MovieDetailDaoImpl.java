package com.army.adminMovieEro.movieAddList.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.army.adminMovieEro.movieAddList.model.vo.MovieDetailVo;

@Repository("movieDetailDao")
public class MovieDetailDaoImpl implements MovieDetailDao {
	
	@Autowired
	SqlSession sqlSession;
	
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

}
