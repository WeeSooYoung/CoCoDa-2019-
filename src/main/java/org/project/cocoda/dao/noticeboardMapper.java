package org.project.cocoda.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.project.cocoda.vo.board;
import org.project.cocoda.vo.reply;

public interface noticeboardMapper {

public List<board> readingBoard(String searchText, RowBounds rb);
	
	public int addHits(int boardnum);
	
	public board readingEachBoard(int boardnum);
	
	public int deleteBoard(int boardnum); 
	
	public int updateBoard(board board);
	
	public int getTotal(String searchText);

	public int insertboard(board board);
	
}
