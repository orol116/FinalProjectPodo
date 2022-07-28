package edu.kh.podo.alarm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import edu.kh.podo.alarm.model.service.AlarmService;
import edu.kh.podo.alarm.model.vo.Alarm;

@Controller
public class AlarmController {

	@Autowired
	private AlarmService service;
	
	// 알림 불러오기
	@ResponseBody
	@GetMapping("/AlarmList")
	public String alarmListSelect(String memberId) {
		
//		System.out.println(memberId);
		
		List<Alarm> aList = service.alarmListSelect(memberId);
		
		System.out.println(aList);
		
		return new Gson().toJson(aList);
	}
}
