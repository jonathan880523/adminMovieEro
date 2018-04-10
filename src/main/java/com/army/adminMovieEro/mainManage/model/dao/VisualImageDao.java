package com.army.adminMovieEro.mainManage.model.dao;

import java.util.List;

import com.army.adminMovieEro.mainManage.model.vo.VisualImageVO;

public interface VisualImageDao {
	public void create(VisualImageVO vo) throws Exception;
	
	public VisualImageVO read(int img_no) throws Exception;
	
	public void update(VisualImageVO vo) throws Exception;
	
	public void delete(int img_num) throws Exception;
	
	public List<VisualImageVO> listAll() throws Exception;
}
