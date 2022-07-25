package edu.kh.podo.alarm.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.podo.alarm.model.dao.AlarmDAO;
import edu.kh.podo.alarm.model.vo.Alarm;

@Service
public class AlarmServiceImpl implements AlarmService{

	@Autowired
	private AlarmDAO dao;
	
	@Override
	public int insertMessage(Alarm alarmMessage) {
		return dao.insertMessage(alarmMessage);
	}

	
	
}
