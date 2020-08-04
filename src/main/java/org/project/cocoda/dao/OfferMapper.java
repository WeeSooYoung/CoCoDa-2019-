package org.project.cocoda.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public interface OfferMapper {

	public ArrayList<String> selectmonth(HashMap<String,String> datamap);
	
	public Map<String,Object> selectoffer(HashMap<String,Object> temp);
}
