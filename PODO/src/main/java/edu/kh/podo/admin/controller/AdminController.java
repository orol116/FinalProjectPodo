package edu.kh.podo.admin.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import edu.kh.podo.admin.model.service.AdminService;
import edu.kh.podo.admin.model.vo.AdminReply;
import edu.kh.podo.member.model.vo.Member;

@Controller
@RequestMapping("/admin")
@SessionAttributes({"loginMember"})
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
			
			paramMap.put("cp", cp); 
			paramMap.put("boardCode", boardCode);
			
			map = service.searchBoardList(paramMap);
		}
		
		model.addAttribute("map",map);
		
		if(boardCode ==3) {
			
			return "admin/controlInquiry";
		}else if(boardCode ==4) {
			
			return "admin/controlItem";
		}else if(boardCode ==5){
			
			return "admin/controlMember";
		}else if(boardCode==6) {
		
			return "admin/controlReport";
		}else{
		
			return "admin/controlFAQ";
		}
	}
	
	@GetMapping("{boardCode}/write")
	public String FAQWriteForm(@PathVariable("boardCode") int boardCode) {
		
		return "admin/editFAQ";
	}
	
	@PostMapping("{boardCode}/write")
	public String FAQWrite(@PathVariable("boardCode") int boardCode
							, @RequestParam Map<String, Object> paramMap
							, Model model
							, @ModelAttribute("loginMember") Member loginMember
							, HttpServletRequest req
							, RedirectAttributes ra) {
		
		paramMap.put("memberNo", loginMember.getMemberNo());
		paramMap.put("boardCode", boardCode);
		
//		System.out.println(		paramMap.get("boardContent"));
//		System.out.println(paramMap.get("boardTitle"));
		
		
		int boardNo = service.insertBoard(paramMap);
		
		String path = null;
		String message = null;
		
		if(boardNo>0) { // 게시글 등록 성공
			path="/admin/"+boardCode;
			message = "게시글이 등록되었습니다.";
		}else {
			path = req.getHeader("referer");
			message = "게시글삽입 실패...";
		}
		ra.addFlashAttribute("message",message);
		
		return "redirect:"+path;
		
	}
	
	
	// 관리자 게시판 삭제
	@PostMapping("{boardCode}/delete")
	public String adminDelete(@RequestParam String deleteNo
							  ,@PathVariable("boardCode") int boardCode
							  , HttpServletRequest req
							  , RedirectAttributes ra) {

		System.out.println(deleteNo);

			
		int adminDelete = service.adminDelete(deleteNo, boardCode);
	
		
		String path = null;
		String message = null;
		
		if(adminDelete>0) { // 게시글 등록 성공
			path="/admin/"+boardCode;
			message = "게시글이 삭제 되었습니다..";
		}else {
			path = req.getHeader("referer");
			message = "게시글삭제 실패...";
		}
		ra.addFlashAttribute("message",message);
		
		return "redirect:"+path;
	}
	
	
	
	
	
	
}
