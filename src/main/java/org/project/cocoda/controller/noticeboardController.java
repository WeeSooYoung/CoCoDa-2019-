package org.project.cocoda.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.project.cocoda.service.boardService;
import org.project.cocoda.service.noticeboardService;
import org.project.cocoda.vo.board;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class noticeboardController {

private static final Logger logger = LoggerFactory.getLogger(boardController.class);
	
	//寃뚯떆�뙋 愿��젴 �긽�닔媛믩뱾				
		final int countPerPage = 10;			//�럹�씠吏� �떦 湲� �닔	//!!!!!!!!
		final int pagePerGroup = 5;			//�럹�씠吏� �씠�룞 洹몃９ �떦 �몴�떆�븷 �럹�씠吏� �닔//!!!!!!!!	
	
	@Autowired
	noticeboardService service;


	@RequestMapping(value = "noticeboardPage", method = RequestMethod.GET)
	public String readingBoard(
			@RequestParam(value="page", defaultValue="1") int page, //!!!!!!!!
			@RequestParam(value="searchText", defaultValue="") String searchText,
			Model model) {
		
		
		int total = service.getTotal(searchText); //�쟾泥� 湲� 媛쒖닔 //!!!!!!!!
		
		//�럹�씠吏� 怨꾩궛�쓣 �쐞�븳 媛앹껜 �깮�꽦
				PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total); //!!!!!!!!
		
		List<board> boardlist = service.readingBoard(searchText, navi.getStartRecord(), navi.getCountPerPage()); //!!!!!!!!
		//�럹�씠吏� �젙蹂� 媛앹껜�� 湲� 紐⑸줉, 寃��깋�뼱瑜� 紐⑤뜽�뿉 ���옣
				model.addAttribute("boardlist", boardlist);
				model.addAttribute("navi", navi);  //!!!!!!!!
				model.addAttribute("searchText", searchText); //!!!!!!!!		
		
		//readingBoard = service.readingBoard();
		//model.addAttribute("readingBoard",readingBoard);
	
		return "noticeboard";
	}
	
	@RequestMapping(value="noticeboardPagereadingEachBoard", method = RequestMethod.GET)
	public String readingEachBoard(Model model, int boardnum) {
		board eachBoard = null;
		eachBoard = service.readingEachBoard(boardnum);
		model.addAttribute("eachBoard", eachBoard);
		
		return "noticeboardReading";
	}
	
	@RequestMapping(value="noticedelete", method=RequestMethod.GET)
	public String deleteBoard(Model model,int boardnum) {
		System.out.println(boardnum);
		service.deleteBoard(boardnum);
		/*List<board> readingBoard = null;
		readingBoard = service.readingBoard();
		model.addAttribute("readingBoard",readingBoard);*/
		
		return "forward:noticeboardPage";
	}
	
	@RequestMapping(value="noticeupdate", method=RequestMethod.GET)
	public String updateBoard(Model model,board board) {
		System.out.println(board);
		service.updateBoard(board);
		board eachBoard = null;
		eachBoard = service.readingEachBoard(board.getBoardnum());
		model.addAttribute("eachBoard", eachBoard);
		
		return "redirect:noticeboardPagereadingEachBoard?boardnum=" + board.getBoardnum();
	}
	
	@RequestMapping(value = "noticetowrite", method = RequestMethod.GET)
	public String boardWrite() {
		return "noticeboardWrite";
	}

	@RequestMapping (value="noticewrite", method=RequestMethod.POST)
	public String write(board board,HttpSession session) {
		
		System.out.println("board content : " + board.getContent());
		//�꽭�뀡�뿉�꽌 濡쒓렇�씤�븳 �궗�슜�옄�쓽 �븘�씠�뵒瑜� �씫�뼱�꽌 Board媛앹껜�쓽 �옉�꽦�옄 �젙蹂댁뿉 �꽭�똿
		String id = (String) session.getAttribute("admin");
		board.setId(id);
		service.insert(board);
		return "redirect:/noticeboardPage";
	}
	
	

	
}
