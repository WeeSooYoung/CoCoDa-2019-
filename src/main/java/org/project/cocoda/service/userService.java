package org.project.cocoda.service;

import org.project.cocoda.dao.userDao;
import org.project.cocoda.vo.user;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class userService {
	
	@Autowired
	userDao dao;
	
	public user userlogin(user user) {
		user us = dao.userlogin(user);
		return us;
	}
	
	public int userjoin(user user) {
		int result =0;
		result = dao.userjoin(user);
		return result;
	}
	
	public int searchUserid(String userid) {
		int numm = 0;
		numm = dao.searchUserid(userid);
		return numm;
	}
	
	public int joinUser(user user) {
		int number = 0;
		number = dao.joinUser(user);
		return number;
	}

}
