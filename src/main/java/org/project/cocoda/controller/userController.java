package org.project.cocoda.controller;

import javax.servlet.http.HttpSession;

import org.project.cocoda.service.userService;
import org.project.cocoda.vo.user;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;





@Controller
public class userController {

	
	@Autowired
	userService service;
	
	@RequestMapping(value = "/userlogin", method = RequestMethod.GET)
	public String userlogin() {
		return "userlogin";
	}
	
	@RequestMapping(value = "/userjoin", method = RequestMethod.GET)
	public String userjoin() {
		return "userjoin";
	}
	
	@RequestMapping(value = "/userlogin", method = RequestMethod.POST)
	public String userloginForm(user user, HttpSession session) {
		
		String id = null;
		String pw = null;
		
		user us = service.userlogin(user);
		 id = user.getUserid();
		 pw = user.getUserpw();
		 System.out.println(id); 
		if(us!=null) {
			
			if(id.equals(us.getUserid())&&pw.equals(us.getUserpw())) {
				if(id.equals("admin")) {
					System.out.println("adminset");
					session.setAttribute("admin", id);
				} else {
				session.setAttribute("userid", id);
				}
				
				return "redirect:/";
			}
				
		}
		
		return "redirect:/";
	
}
	
	@RequestMapping (value="logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		// 濡쒓렇�븘�썐 泥섎━瑜� �쐞�븳 �옉�뾽
		// 濡쒓렇�븘�썐 �썑�뿉�뒗 泥� �솕硫댁쑝濡� �씠�룞
		// code Here
		session.invalidate(); 
		return "redirect:/";
	}
	
	@RequestMapping (value="userjoin", method=RequestMethod.POST)
	public String userjoin(
			user user,
			Model model) {
		 System.out.println(user);
		int result = service.userjoin(user);
		if (result != 1) {
			//DB���옣�뿉 �떎�뙣�븳 寃쎌슦 alert() 異쒕젰�슜 硫붿떆吏�瑜� 紐⑤뜽�뿉 ���옣
			model.addAttribute("errorMsg", "媛��엯 �떎�뙣");
			return "customer/joinForm";
		}
		model.addAttribute("id", user.getUserid());

		return "customer/joinComplete";
	}
	
	@ResponseBody
	@RequestMapping(value="checkId", method=RequestMethod.GET)
	public int searchUserid(String userid, Model model) {
		int numm=0;
		numm=service.searchUserid(userid);
		System.out.println(numm);
		return numm;
	}
	
	@ResponseBody
	@RequestMapping(value="userJoin", method=RequestMethod.GET)
	public int joinUser(user user, Model model) {
		int number = 0;
		System.out.println(user);
		number=service.joinUser(user);
		return number;
	}
	
}
