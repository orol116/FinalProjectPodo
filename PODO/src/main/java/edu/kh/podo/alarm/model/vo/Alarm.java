package edu.kh.podo.alarm.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Alarm {

	private int alarmNo;
	private String alarmContent;
	private String boardLink;
	private Date alarmTime;

	private int boardNo;
	private String memberId;
	private int memberNo;
	private int targetMemberNo;

}
