package com.army.adminMovieEro.noticeBoard.model.dao;
import java.util.ArrayList;

import com.army.adminMovieEro.noticeBoard.model.vo.noticeVO;


public interface noticeDao {

	public int insertNoticeBoard(noticeVO noticeVO);

	public ArrayList<noticeVO> selectListAdmin();
		
	public noticeVO selectNoticeBoard(int NOTICE_BOARD_NO);

	public int getListCount();

	public int addReadCount(int NOTICE_BOARD_NO);

	public noticeVO selectBoardDetail(int NOTICE_BOARD_NO);

	public int modifyNoticeBoard(noticeVO noticeVO);

	public int deleteNoticeBoard(int NOTICE_BOARD_NO);

	public ArrayList<noticeVO> selectListUser(int currentPage, int limit);




}
