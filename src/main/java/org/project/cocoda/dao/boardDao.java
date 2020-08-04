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
public class boardDao {

	@Autowired
	SqlSession session;
	
	public List<board> readingBoard(String searchText, int startRecord, int countPerPage) {
		//BookMapper mapper = session.getMapper(BookMapper.class);
		//List<Book> bookList = mapper.selectAll(book);
		
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		
		boardMapper mapper = session.getMapper(boardMapper.class);
		System.out.println("ehere!!!!!");
		List<board> readingBoard = mapper.readingBoard(searchText, rb);
		
		return readingBoard;
	}
	
	
	public int insert(board board) {
		boardMapper mapper = session.getMapper(boardMapper.class);
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
		boardMapper mapper = session.getMapper(boardMapper.class);
		board eachBoard = mapper.readingEachBoard(boardnum);
		mapper.addHits(boardnum);
		
		return eachBoard;
	}
	
	public int deleteBoard(int boardnum) {
		int num = 0;
		boardMapper mapper = session.getMapper(boardMapper.class);
		num = mapper.deleteBoard(boardnum);
		
		return num;
	}
	
	public int updateBoard(board board) {
		int num=0;
		boardMapper mapper = session.getMapper(boardMapper.class);
		num=mapper.updateBoard(board);
		
		return num;
	}
	
	public int getTotal(String searchText) {		
		boardMapper mapper = session.getMapper(boardMapper.class);	
		int total = mapper.getTotal(searchText);	
		return total;	
	}		
	
	public int insertReply(reply reply) {
		boardMapper mapper = session.getMapper(boardMapper.class);
		int result = 0;
		result = mapper.insertReply(reply);

		return result;
	}
	
	public ArrayList<reply> listReply(int boardnum){
		boardMapper mapper = session.getMapper(boardMapper.class);
		ArrayList<reply> list = null;
		list=mapper.listReply(boardnum);
		return list;
	}
	
	//리플 삭제
	public void deleteReply(reply reply) {
		boardMapper mapper = session.getMapper(boardMapper.class);
		mapper.deleteReply(reply);
	}
	
	//리플 수정
	public int updateReply(reply reply) {
		boardMapper mapper = session.getMapper(boardMapper.class);
		int numm = 0;
		numm = mapper.updateReply(reply);
		return numm;
	}
}
