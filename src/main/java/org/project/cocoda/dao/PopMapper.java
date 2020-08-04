package org.project.cocoda.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.project.cocoda.vo.Selectincome;
import org.project.cocoda.vo.Selectkey;

public interface PopMapper {
	
	public ArrayList<String> selectmonth(HashMap<String,String> datamap);
	
	public Selectkey selectstay(HashMap<String,Object> popstay);
	
	public Selectkey selectworker(HashMap<String,Object> popworker);
	
	public Selectkey selectfloat(HashMap<String,Object> popfloat);
	
	public Selectkey selectfloat2(HashMap<String,Object> popfloat);
	
	public Selectincome selectincome(HashMap<String,Object> income);
	
}
