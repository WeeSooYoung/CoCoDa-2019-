package org.project.cocoda.dao;

import java.util.ArrayList;
import java.util.HashMap;

public interface AttractMapper {

	public ArrayList<HashMap<String,Object>> selectattraction(HashMap<String,Object> list);
	
	public ArrayList<HashMap<String,Object>> selectsubway(HashMap<String,Object> list);
}
