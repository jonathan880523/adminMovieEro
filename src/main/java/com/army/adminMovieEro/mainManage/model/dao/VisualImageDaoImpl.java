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
		session.insert("mainManage.createVisual", vo);
	}

	@Override
	public VisualImageVO read(int img_num) throws Exception {
		return session.selectOne("mainManage.readVisual", img_num);
	}

	@Override
	public void update(VisualImageVO vo) throws Exception {
		session.update("mainManage.updateVisual", vo);
	}

	@Override
	public void delete(int img_no) throws Exception {
		session.delete("mainManage.deleteVisual", img_no);
	}

	@Override
	public List<VisualImageVO> listAll() throws Exception {
		return session.selectList("mainManage.listAllVisual");
	}

}
