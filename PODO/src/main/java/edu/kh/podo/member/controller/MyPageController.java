package edu.kh.podo.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.kh.podo.member.model.service.MyPageService;

@Controller
public class MyPageController {
	
	@Autowired
	private MyPageService service;

}