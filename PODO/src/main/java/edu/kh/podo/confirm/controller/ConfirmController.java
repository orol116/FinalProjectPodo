package edu.kh.podo.confirm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.kh.podo.confirm.model.service.ConfirmService;

@Controller
public class ConfirmController {

	private ConfirmService service;
	
	/*
	 * @RequestMapping(value = "/phoneCheck", method = RequestMethod.GET)
	 * 
	 * @ResponseBody public String sendSMS(@RequestParam("phone-box") String
	 * userPhoneNumber) { // �쑕���룿 臾몄옄蹂대궡湲� int randomNumber = (int)((Math.random()*
	 * (9999 - 1000 + 1)) + 1000);//�궃�닔 �깮�꽦
	 * 
	 * service.certifiedPhoneNumber(userPhoneNumber,randomNumber);
	 * 
	 * return Integer.toString(randomNumber); }
	 */
	


}

