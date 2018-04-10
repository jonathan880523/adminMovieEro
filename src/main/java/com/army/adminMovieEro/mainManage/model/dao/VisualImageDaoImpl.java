package com.army.adminMovieEro.mainManage.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.army.adminMovieEro.mainManage.model.vo.VisualImageVO;

@Repository("visualImageDao")
public class VisualImageDaoImpl implements VisualImageDao {
	@Inject
	private SqlSession session;
	
	@Override
	public void create(VisualImageVO vo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public VisualImageVO read(Integer img_num) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(VisualImageVO vo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Integer img_num) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<VisualImageVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
