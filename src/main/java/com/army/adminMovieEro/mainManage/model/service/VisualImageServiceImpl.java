package com.army.adminMovieEro.mainManage.model.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.army.adminMovieEro.mainManage.model.dao.VisualImageDao;
import com.army.adminMovieEro.mainManage.model.vo.VisualImageVO;

@Service("visualImageService")
public class VisualImageServiceImpl implements VisualImageService {

	@Inject
	private VisualImageDao visualImageDao;
	
	@Override
	public void regist(VisualImageVO vo) throws Exception {
		visualImageDao.create(vo);
	}

	@Override
	public VisualImageVO read(Integer img_num) throws Exception {
		return visualImageDao.read(img_num);
	}

	@Override
	public void modify(VisualImageVO vo) throws Exception {
		visualImageDao.update(vo);
	}	
	
	@Override
	public void remove(Integer img_num) throws Exception {
		visualImageDao.delete(img_num);
	}

	@Override
	public List<VisualImageVO> listAll() throws Exception {
		return visualImageDao.listAll();
	}

}
