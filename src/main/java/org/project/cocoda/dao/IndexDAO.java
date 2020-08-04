package org.project.cocoda.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class IndexDAO {
	
	@Autowired
	SqlSession session;

	public List<Map<String, Object>> division_middle(String sales_divison_l_cd) {

		// Base
		IndexMapper mapper = session.getMapper(IndexMapper.class);
		List<Map<String, Object>> result = null;

		// Logic
		result = mapper.division_middle(sales_divison_l_cd);

		return result;
	}

	public HashMap<String, Object> divisionMap(String sales_division_s_cd) {
		// Base
		IndexMapper mapper = session.getMapper(IndexMapper.class);
		HashMap<String, Object> result = null;

		// Logic
		result = mapper.divisionMap(sales_division_s_cd);

		return result;
	}

	public String divisionNm(String sales_division_s_cd) {
		// TODO Auto-generated method stub
		// Base
			IndexMapper mapper = session.getMapper(IndexMapper.class);
			String result = null;
		// Logic
			
			result = mapper.divisionNm(sales_division_s_cd);
			
		return result;
	}

}
	