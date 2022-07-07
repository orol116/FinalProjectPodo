package edu.kh.podo.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;

import edu.kh.podo.admin.model.service.AdminService;
import edu.kh.podo.member.model.vo.Member;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService service;
	
	@GetMapping("/main")
	public String adminMain() {
		
		
		return null;
	}
	
	@GetMapping("/memberList")
	public String selectMemberList() {
		
		List<Member> memberList = service.selectMemberList();
		
		return new Gson().toJson(memberList);
	}
	
	
	
}
