package org.project.cocoda.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DangerDAO {
	
	@Autowired
	SqlSession session;
	
	public JSONArray bringdanger() {
		
		JSONArray array = new JSONArray();
		
		try {
			
			Danger_mapper mapper = session.getMapper(Danger_mapper.class);
			
			ArrayList<HashMap<String,String>> result = mapper.bringdanger();
			
			for (HashMap<String,String> t : result) {
				JSONObject obj = new JSONObject();
				obj.put("SIGUNGU_CD", t.get("SIGUNGU_CD"));
				obj.put("DANGER_CD", t.get("DANGER_CD"));
				obj.put("DANGER_POINT", t.get("DANGER_POINT"));
				array.add(obj);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return array;
	}
	
	
}
