package org.project.cocoda.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.project.cocoda.vo.Selectincome;
import org.project.cocoda.vo.Selectkey;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PopDao {
	@Autowired
	SqlSession session;
	
	public ArrayList<Selectkey> selectstay(int sigungu_cd) {
		ArrayList<Selectkey> result = new ArrayList<>();
		String data = "stay";
		HashMap<String,String> datamap = new HashMap<>();
		datamap.put("data", data);
		try {
			PopMapper mapper = session.getMapper(PopMapper.class);
			
			ArrayList<String> datedata = mapper.selectmonth(datamap);
			
			for (String fixed_date : datedata) {
				
				HashMap<String,Object> popstay = new HashMap<String,Object>();
				popstay.put("fixed_date", (String) fixed_date);
				popstay.put("sigungu_cd", (Integer) sigungu_cd);
				Selectkey temp = mapper.selectstay(popstay);
				String[] monthtemp = fixed_date.split("");
				
				if (monthtemp[5].equals("0")) {
					temp.setFixed_month(Integer.parseInt(monthtemp[6]));
				} else {
					temp.setFixed_month(Integer.parseInt(monthtemp[5]+monthtemp[6]));
				}
				result.add(temp);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<Selectkey> selectworker(int sigungu_cd) {
		ArrayList<Selectkey> result = new ArrayList<>();
		String data = "worker";
		HashMap<String,String> datamap = new HashMap<>();
		datamap.put("data", data);
		
		try {
			PopMapper mapper = session.getMapper(PopMapper.class);
			
			ArrayList<String> datedata = mapper.selectmonth(datamap);
				
			for (String fixed_date : datedata) {
				
				HashMap<String,Object> popworker = new HashMap<String,Object>();
				popworker.put("fixed_date", (String) fixed_date);
				popworker.put("sigungu_cd", (Integer) sigungu_cd);
				Selectkey temp = mapper.selectworker(popworker);
				String[] monthtemp = fixed_date.split("");
				
				if (monthtemp[5].equals("0")) {
					temp.setFixed_month(Integer.parseInt(monthtemp[6]));
				} else {
					temp.setFixed_month(Integer.parseInt(monthtemp[5]+monthtemp[6]));
				}

				result.add(temp);

			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<Selectkey> selectfloat(int sigungu_cd) {
		ArrayList<Selectkey> result = new ArrayList<>();
		String data = "float";
		HashMap<String,String> datamap = new HashMap<>();
		datamap.put("data", data);
		try {
			PopMapper mapper = session.getMapper(PopMapper.class);
			ArrayList<String> datedata = mapper.selectmonth(datamap);
			
			for (String fixed_date : datedata) {
				
				HashMap<String,Object> popfloat = new HashMap<String,Object>();
				popfloat.put("fixed_date", (String) fixed_date);
				popfloat.put("sigungu_cd", (Integer) sigungu_cd);
				Selectkey temp = mapper.selectfloat(popfloat);
				
				String[] monthtemp = fixed_date.split("");
				
				if (monthtemp[5].equals("0")) {
					temp.setFixed_month(Integer.parseInt(monthtemp[6]));
				} else {
					temp.setFixed_month(Integer.parseInt(monthtemp[5]+monthtemp[6]));
				}
				
				result.add(temp);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	

	public ArrayList<Selectkey> selectfloat2(double wgsx,double wgsy) {
		ArrayList<Selectkey> result = new ArrayList<>();
		String data = "float";
		HashMap<String,String> datamap = new HashMap<>();
		datamap.put("data", data);
		try {
			PopMapper mapper = session.getMapper(PopMapper.class);
			ArrayList<String> datedata = mapper.selectmonth(datamap);
			
			for (String fixed_date : datedata) {
				
				HashMap<String,Object> popfloat = new HashMap<String,Object>();
				popfloat.put("fixed_date", (String) fixed_date);
				//popfloat.put("sigungu_cd", (Integer) sigungu_cd);
				popfloat.put("wgsx", wgsx);
				popfloat.put("wgsy", wgsy);
				Selectkey temp = mapper.selectfloat2(popfloat);
				
				String[] monthtemp = fixed_date.split("");
				
				if (monthtemp[5].equals("0")) {
					temp.setFixed_month(Integer.parseInt(monthtemp[6]));
				} else {
					temp.setFixed_month(Integer.parseInt(monthtemp[5]+monthtemp[6]));
				}
				
				result.add(temp);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	
	public ArrayList<Selectincome> selectincome(int sigungu_cd) {
		ArrayList<Selectincome> result = new ArrayList<>();
		String data = "income";
		HashMap<String,String> datamap = new HashMap<>();
		datamap.put("data", data);
		try {
			PopMapper mapper = session.getMapper(PopMapper.class);
			ArrayList<String> datedata = mapper.selectmonth(datamap);
			
			for (String fixed_date : datedata) {

				HashMap<String,Object> popincome = new HashMap<String,Object>();
				popincome.put("fixed_date", (String) fixed_date);
				popincome.put("sigungu_cd", (Integer) sigungu_cd);
				Selectincome temp = mapper.selectincome(popincome);
				String[] monthtemp = fixed_date.split("");
				
				if (monthtemp[5].equals("0")) {
					temp.setFixed_month(Integer.parseInt(monthtemp[6]));
				} else {
					temp.setFixed_month(Integer.parseInt(monthtemp[5]+monthtemp[6]));
				}

				result.add(temp);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
