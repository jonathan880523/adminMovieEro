package com.army.adminMovieEro.mainManage.model.dao;

import java.util.List;

import com.army.adminMovieEro.mainManage.model.vo.VisualImageVO;

public interface VisualImageDao {
	public void create(VisualImageVO vo) throws Exception;
	public VisualImageVO read(Integer img_num) throws Exception;
	public void update(VisualImageVO vo) throws Exception;
	public void delete(Integer img_num) throws Exception;
	public List<VisualImageVO> listAll() throws Exception;
}
