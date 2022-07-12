package edu.kh.podo.confirm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.kh.podo.confirm.model.service.ConfirmService;

@Controller
public class ConfirmController {

	private ConfirmService service;
	
	@GetMapping("/phoneCheck")
	@ResponseBody
	public String sendSMS(@RequestParam("phone-box") String userPhoneNumber) { // 휴대폰 문자보내기
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);//난수 생성

		service.certifiedPhoneNumber(userPhoneNumber,randomNumber);
		
		return Integer.toString(randomNumber);
	}
}
