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

@SessionAttributes({ "loginMember" })
@RequestMapping("/member")
@Controller
public class MemberController {

	private Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService service;

	
	// 로그인 화면전환
	@GetMapping("login")
	public String login() {
		return "/member/member-login";
	}

	// 로그인
	@PostMapping("login")
	public String login(@ModelAttribute Member inputMember, Model model, RedirectAttributes ra,
			HttpServletResponse resp, HttpServletRequest req,
			@RequestParam(value = "saveId", required = false) String saveId) {

		logger.info("로그인 기능 수행됨");

		Member loginMember = service.login(inputMember);

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
		} else {
			ra.addFlashAttribute("message", "아이디 또는 비밀번호가 일치하지 않습니다.");
		}

		return "redirect:/";
	}
	
	
	// 로그아웃
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		
		logger.info("로그아웃 수행됨");
		
		status.setComplete();
		
		return "redirect:/";
	}
	
		
		// 판매상품 업로드 페이지
		@PostMapping("/member-upload")
		public String upload() {
			return "member/member-upload";
		}
}
