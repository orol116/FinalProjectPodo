package edu.kh.podo.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;

import edu.kh.podo.admin.model.service.AdminService;
import edu.kh.podo.member.model.vo.Member;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService service;
	
	@GetMapping("/{boardCode}")
	public String adminMain(@RequestParam(value="cp", required = false , defaultValue="1") int cp
							, @PathVariable("boardCode") int boardCode
							, Model model,
							@RequestParam Map<String,Object> paramMap) {
		
		Map<String, Object> map = null;
		
		if(paramMap.get("key")==null) { // 검색이 아닌 경우
			
			 map = service.inquiryList(cp, boardCode); 
			
		}else { // 검색인 경우
			
			// 검색에 필요한 데이터를 paramMap에 모두 담아서 서비스 호출
			// key, query, cp, boardCode가 필요하다
			paramMap.put("cp", cp); // 있으면 같은 값으로 덮어쓰기, 없으면 추가. 
									// cp를 requestParam으로 디폴트값이라도 가져왔으니깐 cp=1 이라는 값을 추가할 수 있다.
			
//			map = service.searchBoardList(paramMap);
		}
		
		model.addAttribute("map",map);
		if(boardCode ==3) {
			
			return "admin/controlInquiry";
		}else if(boardCode ==4) {
			
			return "admin/controlItem";
		}else {
			
			return "admin/controlMember";
		}
	}
	
	
	@GetMapping("/controlItem")
	public String controllItem() {
		
		return "admin/controlItem";
	}
	
	@GetMapping("/controlMember")
	public String controlMember() {
		
		return "admin/controlMember";
	}
	
	
	
}
