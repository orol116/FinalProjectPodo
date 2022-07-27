package edu.kh.podo.report.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReportDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 신고 작성 DAO
	 * @param map
	 * @return result
	 */
	public int insertReport(Map<String, Object> map) {
		return sqlSession.insert("reportMapper.insertReport", map);
	}

}
