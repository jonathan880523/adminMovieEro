package com.army.adminMovieEro;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.army.adminMovieEro.movieAddList.model.dao.MovieAddListDao;
import com.army.adminMovieEro.movieAddList.model.vo.MovieAddListVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class MovieAddListDaoTest {
	
	@Inject
	private MovieAddListDao dao;
	
	private static Logger logger = LoggerFactory.getLogger(MovieAddListDaoTest.class);
	
	@Test
	public void testInsert() throws Exception{
		
		MovieAddListVo vo = new MovieAddListVo();
		vo.setTITLE("테스트영화");
		vo.setTHEATER("test영화관");
		vo.setSUB_TITLE("test movie");
		vo.setPUB_DATE("테스트 날짜 2018/03/21");
		vo.setDIRECTOR("테스트 감독");
		vo.setACTOR("테스트 배우");
		vo.setUSER_RATING(10);
		vo.setIMAGE("테스트 사진 경로");
		System.out.println(vo);
		dao.insertMovie(vo);
	}
	
	@Test
	public void testDelete() throws Exception{
		
		MovieAddListVo vo = new MovieAddListVo();
		vo.getSEQUENCE();
		dao.deleteMovie(vo);
	}
	
}
