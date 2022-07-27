package edu.kh.podo.alarm.model.service;

import java.util.Map;

import org.springframework.stereotype.Service;

import edu.kh.podo.alarm.model.vo.Alarm;


public interface AlarmService {

	int insertMessage(Alarm alarmMessage);

	String selectMemberId(int recieverMemberNo);

	String selectRecieverId(Map<String, Object> map);

}
