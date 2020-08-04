package org.project.cocoda.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.json.simple.JSONArray;
import org.project.cocoda.service.TotalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TotalController {
	@Autowired
	TotalService service;

	
	@ResponseBody
	@RequestMapping(value = "sales_info", method = RequestMethod.POST)
	public HashMap<String, Object> SalesInfo(@RequestBody ArrayList<String> sigungu_arr){
		// Base
			HashMap<String, Object>  result = null;
			System.out.println("상권번호  : " + sigungu_arr);
		// Logic
			result = service.SalesInfo(sigungu_arr);
			
		return result;
		
	}
	
//	Total
	@ResponseBody
	@RequestMapping(value = "total", method = RequestMethod.GET)
	public ArrayList<HashMap<String, Object>> Total(String sigungu_cd,String sales_divison_s_cd){
		// Base
			ArrayList<HashMap<String, Object>> result = new ArrayList<>();
		
		// Logic
			result.add(service.Growth	 (sigungu_cd));
			result.add(service.Stability (sigungu_cd, sales_divison_s_cd));
			result.add(service.Collect	 (sigungu_cd));
			result.add(service.Purchasing(sigungu_cd));
		
		return result;
	}
	
}
