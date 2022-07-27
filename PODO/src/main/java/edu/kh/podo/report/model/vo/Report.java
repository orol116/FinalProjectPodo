package edu.kh.podo.report.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class Report {
	
	private int reportNo;
	private String reportContent;
	private int reportCode;
	private int memberNo;
	private Date reportDate;

}
