package edu.kh.podo.report.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.kh.podo.report.model.service.ReportService;

@Controller
public class ReportController {
	
	@Autowired
	private ReportService service;
	
	// 신고 작성
	@GetMapping("/report")
	@ResponseBody
	public int report(String report, int select, int memberNo) {
		
		return service.insertReport(report, select, memberNo);
	}

}
