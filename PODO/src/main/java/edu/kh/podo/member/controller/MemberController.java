package edu.kh.podo.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

import edu.kh.podo.member.model.service.MemberService;
import edu.kh.podo.member.model.vo.Member;

@RequestMapping("/member")
@SessionAttributes({"loginMember", "message"})
@Controller
public class MemberController {

	private Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService service;

	// 로그인 화면전환
	@GetMapping("/login")
	public String login() {
		return "/member/member-login";
	}

	@GetMapping("/loginNaver")
	public String loginNaver() {
		return "/member/naver-login";
	}

	// 로그인
	@PostMapping("/login")
	public String login(@ModelAttribute Member inputMember, Model model, RedirectAttributes ra,
			HttpServletResponse resp, HttpServletRequest req,
			@RequestParam(value = "saveId", required = false) String saveId) {

		logger.info("로그인 기능 수행됨");

		Member loginMember = service.login(inputMember);

		String path = null;

		if (loginMember != null) {

			model.addAttribute("loginMember", loginMember);

			Cookie cookie = new Cookie("saveId", loginMember.getMemberId());

			if (saveId != null) {

				cookie.setMaxAge(60 * 60 * 24 * 365);

			} else {
				cookie.setMaxAge(0);
			}

			cookie.setPath(req.getContextPath());

			resp.addCookie(cookie);
			path = "/";

		} else {
			path = "/member/login";
			ra.addFlashAttribute("message", "아이디 또는 비밀번호가 일치하지 않습니다.");

		}

		return "redirect:" + path;
	}

	// 로그아웃
	@GetMapping("/logout")
	public String logout(SessionStatus status) {

		logger.info("로그아웃 수행됨");

		status.setComplete();

		return "redirect:/";
	}

	// 회원가입 페이지 전환
	@GetMapping("/signUp")
	public String signUp() {

		return "/member/signUp";
	}

	// 아이디 중복확인
	@GetMapping("/DupliCheckId")
	public String DupliCheckId() {
		return "";
	}

	// 로그인 중복확인
	@GetMapping("DupliCheckPw")
	public String DupliCheckPw() {
		return "";
	}

	// 회원가입
	@PostMapping("/signUp")
	public String SignUp(Member inputMember, String memberAddress[], RedirectAttributes ra) {

		int result = service.signUp(inputMember);

		String path = null;
		String message = null;

		if (result > 0) {

			path = "/";
			ra.addFlashAttribute("message", "회원가입이 완료되었습니다.");

		} else {

			path = "/signUp";
			ra.addFlashAttribute("message", "회원가입 실패");
		}

		return "redirect:/";
	}

	// 판매관리 페이지
	@GetMapping("/itemUpload")
	public String upload() {
	
		return "member/itemUpload";
	}
	
//	// 판매상품 업로드 페이지
//	@GetMapping("/itemManage")
//	public String manage() {
//		
//		return "member/itemManage";
//	}
	// 아이디 찾기 페이지 전환
	@GetMapping("/findId")
	public String fingId() {
		return "/member/member-find-ID";
	}

	// 비밀번호 찾기 페이지 전환
	@GetMapping("/findPw")
	public String findPw() {
		return "/member/member-find-PW";
	}
}
