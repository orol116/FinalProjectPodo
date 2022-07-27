package edu.kh.podo.report.model.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.podo.report.model.dao.ReportDAO;

@Service
public class ReportServiceImpl implements ReportService {
	
	@Autowired
	private ReportDAO dao;

	// 신고 작성 Service 구현
	@Override
	public int insertReport(String report, int select, int memberNo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("report", report);
		map.put("select", select);
		map.put("memberNo", memberNo);
		
		return dao.insertReport(map);
	}

}
