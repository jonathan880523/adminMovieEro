package com.army.adminMovieEro.mainManage.model.service;

import java.util.List;

import com.army.adminMovieEro.mainManage.model.vo.VisualImageVO;

public interface VisualImageService {
	public void regist(VisualImageVO board) throws Exception;
	
	public VisualImageVO read(Integer img_num) throws Exception;
	
	public void modify(VisualImageVO board) throws Exception;
	
	public void remove(Integer img_num) throws Exception;
	
	public List<VisualImageVO> listAll() throws Exception;
}
