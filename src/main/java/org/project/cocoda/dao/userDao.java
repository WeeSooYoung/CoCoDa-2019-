package org.project.cocoda.dao;

import org.apache.ibatis.session.SqlSession;
import org.project.cocoda.vo.user;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class userDao {

	@Autowired
	SqlSession session;
	
	public user userlogin(user user) {
		
			userMapper mapper = session.getMapper(userMapper.class);
			user us = mapper.userlogin(user);
			return us;
		
	}
	
	public int userjoin(user user) {
		int result =0;
			userMapper mapper = session.getMapper(userMapper.class);
			result=mapper.userjoin(user);
			
			return result;
		
	}
	
	public int searchUserid(String userid) {
		userMapper mapper = session.getMapper(userMapper.class);
		String name = mapper.searchUserid(userid);
		if(name!=null)
			return 1;
		
		return 0;
	}
	
	public int joinUser(user user) {
		int number=0;
		userMapper mapper = session.getMapper(userMapper.class);
		number = mapper.joinUser(user);
		
		return number;
	}
}
