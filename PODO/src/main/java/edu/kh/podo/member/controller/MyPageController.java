package edu.kh.podo.member.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.podo.board.itemBoard.model.vo.ItemBoard;
import edu.kh.podo.member.model.service.MyPageService;
import edu.kh.podo.member.model.vo.Member;

@Controller
@RequestMapping("/member/myPage")
@SessionAttributes({"loginMember"})
public class MyPageController {
	
	@Autowired
	private MyPageService service;
	
	// 회원 정보 수정
	@GetMapping("/profileUpdate")
	public String updateInfo(@ModelAttribute("loginMember") Member loginMember
						   , @RequestParam Map<String, Object> paramMap
						   , String[] updateAddress
						   , RedirectAttributes ra) {
		
//		String memberAddress = String.join(",,", updateAddress);
//		
//		if (memberAddress.equals(",,,,")) memberAddress = null;
//		
//		paramMap.put("memberNo", loginMember.getMemberNo());
//		paramMap.put("memberAddress", memberAddress);
//		
//		int result = service.updateInfo(paramMap);
//		
//		String message = null;
//		
//		if (result > 0) {
//			message = "회원 정보가 수정되었습니다.";
//			
//			loginMember.setMemberNickname((String)paramMap.get("updateNickname"));
//			loginMember.setMemberTel((String)paramMap.get("updateNickname"));
//			loginMember.setMemberAddress((String)paramMap.get("updateNickname"));
//		} else {
//			message = "회원 정보 수정에 실패하였습니다.";
//		}
//		ra.addFlashAttribute("message", message);
		
		return "member/myPage/myPage-profileUpdate";
	}
	
	// 비밀번호 변경
	@GetMapping("/changePw")
	public String changePw() {
		return "member/myPage/myPage-changePw";
	}
	
	@PostMapping("/changePw")
	public String changePw(@ModelAttribute("loginMember") Member loginMember
						 , @RequestParam Map<String, Object> pwMap
						 , RedirectAttributes ra) {
		
		pwMap.put("memberNo", loginMember.getMemberNo());
		
		int result = service.updatePw(pwMap);
		
		String message = null;
		
		if (result > 0) message = "비밀번호가 변경되었습니다.";
		else message = "현재 비밀번호가 일치하지 않습니다.";
		
		ra.addFlashAttribute("message", message);
		
		return "redirect:changePw";
	}
	
	// 회원 탈퇴
	@GetMapping("/secession")
	public String secession() {
		return "member/myPage/myPage-secession";
	}
	
	@PostMapping("/secession")
	public String secession(@ModelAttribute("loginMember") Member loginMember
						  , RedirectAttributes ra
						  , HttpServletRequest req
						  , HttpServletResponse resp
						  , SessionStatus status) {
		
		int result = service.secession(loginMember);
		String message = null;
		
		if (result > 0) {
			message = "회원 탈퇴가 완료되었습니다.";
			ra.addFlashAttribute("message", message);
			
			status.setComplete();
			
			Cookie cookie = new Cookie("saveId", "");
			cookie.setMaxAge(0);
			cookie.setPath(req.getContextPath());
			resp.addCookie(cookie);
			
			return "redirect:/";
		} else {
			message = "현재 비밀번호가 일치하지 않습니다.";
			ra.addFlashAttribute("message", message);
			return "redirect:secession";
		}
	}
	
	// 찜 상품 조회
	@GetMapping("/myFavorites")
	public String myFavorites(@ModelAttribute("loginMember") Member loginMember
							, Model model) {
		
		List<ItemBoard> favorBoard = service.selectFavorList(loginMember.getMemberNo());
		
		model.addAttribute("favorBoard", favorBoard);
		
		return "member/myPage/myPage-favorites";
	}

}
