package org.project.cocoda.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.project.cocoda.vo.board;
import org.project.cocoda.vo.reply;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class noticeboardDao {

	@Autowired
	SqlSession session;
	
	public List<board> readingBoard(String searchText, int startRecord, int countPerPage) {
		//BookMapper mapper = session.getMapper(BookMapper.class);
		//List<Book> bookList = mapper.selectAll(book);
		
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		
		noticeboardMapper mapper = session.getMapper(noticeboardMapper.class);
		System.out.println("ehere!!!!!");
		List<board> readingBoard = mapper.readingBoard(searchText, rb);
		
		return readingBoard;
	}
	
	
	public int insert(board board) {
		noticeboardMapper mapper = session.getMapper(noticeboardMapper.class);
		int result = 0;
		try {
			result = mapper.insertboard(board);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	public board readingEachBoard(int boardnum) {
		noticeboardMapper mapper = session.getMapper(noticeboardMapper.class);
		board eachBoard = mapper.readingEachBoard(boardnum);
		mapper.addHits(boardnum);
		
		return eachBoard;
	}
	
	public int deleteBoard(int boardnum) {
		int num = 0;
		noticeboardMapper mapper = session.getMapper(noticeboardMapper.class);
		num = mapper.deleteBoard(boardnum);
		
		return num;
	}
	
	public int updateBoard(board board) {
		int num=0;
		noticeboardMapper mapper = session.getMapper(noticeboardMapper.class);
		num=mapper.updateBoard(board);
		
		return num;
	}
	
	public int getTotal(String searchText) {		
		noticeboardMapper mapper = session.getMapper(noticeboardMapper.class);	
		int total = mapper.getTotal(searchText);	
		return total;	
	}		
	
}
