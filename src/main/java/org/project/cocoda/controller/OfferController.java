package org.project.cocoda.controller;

import org.json.simple.JSONArray;
import org.project.cocoda.dao.OfferDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class OfferController {

		@Autowired
		OfferDAO dao;
		
		@RequestMapping(value="selectoffer")
		@ResponseBody
		public JSONArray offer(int sigungu_cd,String sales_divison_s_cd) {
			
			JSONArray result = null;
			
			result = dao.selectoffer(sigungu_cd, sales_divison_s_cd);
			
			return result;
			
		}
		
		@RequestMapping(value="mapsosa", method=RequestMethod.GET)
		@ResponseBody
		public JSONArray mapsosa(int sigungu_cd, String sales_divison_s_cd) {
			
			JSONArray result = null;
			
			result = dao.selectoffer(sigungu_cd, sales_divison_s_cd);

			return result;
		}
		
		
	}


