package org.project.cocoda.dao;

import org.project.cocoda.vo.user;

public interface userMapper {

	public user userlogin(user user);
	
	public int userjoin(user user);
	
	public String searchUserid(String userid);
	
	public int joinUser(user user);
}
