package com.army.adminMovieEro;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.army.adminMovieEro.movieAddList.model.dao.MovieListDao;
import com.army.adminMovieEro.movieAddList.model.vo.MovieListVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class MovieAddListDaoTest {
	
	@Inject
	private MovieListDao dao;
	
	private static Logger logger = LoggerFactory.getLogger(MovieAddListDaoTest.class);
	
	@Test
	public void testInsert() throws Exception{
		
		MovieListVo vo = new MovieListVo();
		vo.setTITLE("테스트영화");
		vo.setSUB_TITLE("test movie");
		vo.setPUB_DATE("테스트 날짜 2018/03/21");
		vo.setDIRECTOR("테스트 감독");
		vo.setACTOR("테스트 배우");
		System.out.println(vo);
	}
	
	@Test
	public void testDelete() throws Exception{
		
		MovieListVo vo = new MovieListVo();
	}
	
}
