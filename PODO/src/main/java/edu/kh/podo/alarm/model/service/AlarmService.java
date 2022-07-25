package edu.kh.podo.alarm.model.service;

import org.springframework.stereotype.Service;

import edu.kh.podo.alarm.model.vo.Alarm;


public interface AlarmService {

	int insertMessage(Alarm alarmMessage);

}
