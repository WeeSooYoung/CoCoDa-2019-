package org.project.cocoda.controller;

import java.util.HashMap;

import org.json.simple.JSONArray;
import org.project.cocoda.dao.AttractDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AttractController {
	@Autowired
	AttractDao dao;
	
	@RequestMapping(value="selectattraction")
	@ResponseBody
	public JSONArray selectattraction(int sigungu_cd) {
		
		JSONArray result = null;
		
		result = dao.selectattraction(sigungu_cd);
		
		return result;
		
	}
	
	@RequestMapping(value = "/selectsubway", method = RequestMethod.GET)
	@ResponseBody
	public JSONArray bringsub(double wgsx, double wgsy) {
		
		JSONArray result = null;
		
		HashMap<String,Object> temp = new HashMap<>();
		temp.put("wgsx", wgsx);
		temp.put("wgsy", wgsy);
		
		result = dao.selectsubway(temp);
		
		return result;
	}
}
