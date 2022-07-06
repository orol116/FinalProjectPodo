package edu.kh.podo.member.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.podo.member.model.service.MyPageService;
import edu.kh.podo.member.model.vo.Member;

@Controller
@RequestMapping("/member/myPage")
@SessionAttributes("loginMember")
public class MyPageController {
	
	@Autowired
	private MyPageService service;
	
	// 회원 정보 수정
	@PostMapping("/info")
	public String updateInfo(@ModelAttribute("loginMember") Member loginMember
						   , @RequestParam Map<String, Object> paramMap
						   , String[] updateAddress
						   , RedirectAttributes ra) {
		
		String memberAddress;
		
		return null;
	}

}
