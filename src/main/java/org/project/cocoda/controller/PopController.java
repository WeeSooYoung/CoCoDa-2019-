package org.project.cocoda.controller;

import java.util.ArrayList;

import org.project.cocoda.dao.PopDao;
import org.project.cocoda.vo.Selectincome;
import org.project.cocoda.vo.Selectkey;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class PopController {
	@Autowired
	PopDao dao;
	
	@RequestMapping(value = "selectstay", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<Selectkey> selectstay(int sigungu_cd) {
		ArrayList<Selectkey> result = null;
		
		result = dao.selectstay(sigungu_cd);
		
		return result;
	}
	
	@RequestMapping(value = "selectworker", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<Selectkey> selectworker(int sigungu_cd) {
		ArrayList<Selectkey> result = null;
		
		result = dao.selectworker(sigungu_cd);
		
		return result;
	}
	
	@RequestMapping(value = "selectfloat", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<Selectkey> selectfloat(int sigungu_cd) {
		ArrayList<Selectkey> result = null;

		result = dao.selectfloat(sigungu_cd);

		return result;
		}
	
	@RequestMapping(value = "selectfloat2", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<Selectkey> selectfloat2(double wgsx, double wgsy) {
		ArrayList<Selectkey> result = null;

		result = dao.selectfloat2(wgsx,wgsy);

		return result;
		}
	
	
	@RequestMapping(value = "selectincome", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<Selectincome> selectincome(int sigungu_cd) {
		ArrayList<Selectincome> result = new ArrayList<>();
		
		result = dao.selectincome(sigungu_cd);
		
		return result;
	}
}
