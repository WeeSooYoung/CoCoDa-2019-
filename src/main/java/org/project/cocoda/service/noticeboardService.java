package org.project.cocoda.service;

import java.util.ArrayList;
import java.util.List;

import org.project.cocoda.dao.boardDao;
import org.project.cocoda.dao.noticeboardDao;
import org.project.cocoda.vo.board;
import org.project.cocoda.vo.reply;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class noticeboardService {

	@Autowired
	noticeboardDao dao;
	
	public List<board> readingBoard(String searchText, int startRecord, int countPerPage) {
		List<board> bo= null;
		
		bo=dao.readingBoard(searchText,startRecord,countPerPage);
		
		return bo;
	}
	
	public int insert(board board) {
		int num =0;
		
		num=dao.insert(board);
		
		return num;
	}
	
	
	public board readingEachBoard(int boardnum) {
		board eachBoard = null;
		eachBoard = dao.readingEachBoard(boardnum);
		
		return eachBoard;		
	}
	
	public int deleteBoard(int boardnum) {
		int num = 0;
		num=dao.deleteBoard(boardnum);
		
		return num;
	}
	
	public int updateBoard(board board) {
		int num= 0;
		num = dao.updateBoard(board);
		
		return num;
	}
	
	public int getTotal(String searchText) {
		int num = 0;
		num = dao.getTotal(searchText);
		
		return num;
	}
	
}
