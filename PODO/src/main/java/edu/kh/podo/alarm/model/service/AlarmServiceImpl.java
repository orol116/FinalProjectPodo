package edu.kh.podo.alarm.model.service;

import java.util.List;
import java.util.Map;

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

	@Override
	public String selectMemberId(int recieverMemberNo) {
		return dao.selectMemberId(recieverMemberNo);
	}

	@Override
	public String selectRecieverId(Map<String, Object>map) {
		return dao.selectRecieverId(map);
	}

	@Override
	public List<String> selectBuyerId(int boardNo) {
		return dao.selectBuyerId(boardNo);
	}

	
	
}
