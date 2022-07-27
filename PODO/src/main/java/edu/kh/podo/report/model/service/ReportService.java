package edu.kh.podo.report.model.service;

public interface ReportService {

	/** 신고 작성 Service
	 * @param report
	 * @param select
	 * @param memberNo
	 * @return result
	 */
	int insertReport(String report, int select, int memberNo);

}
