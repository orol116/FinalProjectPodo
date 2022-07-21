package edu.kh.podo.member.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import edu.kh.podo.member.model.service.MemberService;
import edu.kh.podo.member.model.vo.Member;

@RequestMapping("/member")
@SessionAttributes({ "loginMember" })
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

	
	// 네이버 로그인
	@GetMapping("/selectNaver")
	public String selectNaver(@RequestParam(value = "email", required = false) String email, Model model,
			RedirectAttributes ra, @RequestParam(value = "saveId", required = false) String saveId,
			HttpServletResponse resp, HttpServletRequest req) {

		Member inputMember = new Member();
		inputMember.setMemberId(email);

		Member loginMember = service.naverLogin(inputMember);

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
			path = "redirect:/";

		} else {
			path = "redirect:/member/naverSingUp?email=" + email;
		}

		return path;
	}
	// 네이버 회원가입
	@GetMapping("/naverSingUp")
	public String naverSignUp(@RequestParam("email") String email, RedirectAttributes ra) {
		Member inputMember = new Member();

		inputMember.setMemberId(email);

		int result = service.naverSignUp(inputMember);

		String path = null;
		String message = null;

		if (result > 0) {

			path = "/";
			ra.addFlashAttribute("message", "회원가입이 완료되었습니다.");

		} else {

			path = "/member/signUp";
			ra.addFlashAttribute("message", "회원가입 실패");
		}

		return "redirect:" + path;
	}
		
	
	// 카카오 로그인
	@GetMapping("/selectKakao")
	public String selectKakao(@RequestParam(value = "email", required = false) String email, Model model,
			RedirectAttributes ra, @RequestParam(value = "saveId", required = false) String saveId,
			HttpServletResponse resp, HttpServletRequest req) {

		Member inputMember = new Member();
		email = email+"_Ka";
		inputMember.setMemberId(email);
		

		Member loginMember = service.naverLogin(inputMember);

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
			path = "redirect:/";

		} else {
			path = "redirect:/member/kakaoSingUp?email=" + email;
		}

		return path;
	}
	// 카카오 회원가입
	@GetMapping("/kakaoSingUp")
	public String kakaoSignUp(@RequestParam("email") String email, RedirectAttributes ra) {
		Member inputMember = new Member();
		
		inputMember.setMemberId(email);
		
		int result = service.naverSignUp(inputMember);
		
		String path = null;
		String message = null;
		
		if (result > 0) {
			
			path = "/";
			ra.addFlashAttribute("message", "회원가입이 완료되었습니다.");
			
		} else {
			
			path = "/member/login";
			ra.addFlashAttribute("message", "회원가입 실패");
		}
		
		return "redirect:" + path;
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
			
			if (loginMember.getAdmin() == 'Y') {

				path = "redirect:/admin/5";
			} else {
				path = "redirect:/";
			}

		} else {
			ra.addFlashAttribute("message", "아이디 또는 비밀번호가 일치하지 않습니다.");
			path = "redirect:/member/login";
		}

		return path;
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
	@ResponseBody
	@GetMapping("/idDupCheck")
	public int idDupCheck(String memberId) {
		
		int result = service.idDupCheck(memberId);
		return result;
	}

	// 닉네임 중복확인
	@ResponseBody
	@GetMapping("nicknameDupCheck")
	public int nicknameDupCheck(String memberNickname) {
		
		int result = service.nicknameDupCheck(memberNickname);
		
		return result;
	}

	// 회원가입
	@PostMapping("/signUp")
	public String SignUp(Member inputMember, String memberAddress[], RedirectAttributes ra) {

		inputMember.setMemberAddress(String.join(",,", memberAddress));

		if (inputMember.getMemberAddress().equals(",,,,")) {
			inputMember.setMemberAddress(null);
		}

		int result = service.signUp(inputMember);

		String path = null;

		if (result > 0) {

			path = "/";
			ra.addFlashAttribute("message", "회원가입이 완료되었습니다.");

		} else {

			path = "/member/signUp";
			ra.addFlashAttribute("message", "회원가입 실패");
		}

		return "redirect:" + path;
	}

	
	// 1:1문의 페이지
	@GetMapping("/inquire")
	public String inquire(@ModelAttribute("loginMember") Member loginMember
						  ,RedirectAttributes ra) {
		
		
		int memberNo = loginMember.getMemberNo();
		
		
		int count = service.inquireCount(memberNo);
		
		if(count>0	) {
			
			return "redirect:/member/inquireList";
		}else {
			
			return "member/inquire";
		}
		
	}
	
	@PostMapping("/inquire")
	public String inquireWrite(@RequestParam Map<String, Object> paramMap
							 , @ModelAttribute("loginMember") Member loginMember
							 , @RequestParam(value="images", required=false) List<MultipartFile> imageList
							 , HttpServletRequest req
							 , RedirectAttributes ra) throws IOException  {
		
		paramMap.put("memberNo", loginMember.getMemberNo());
		
		String webPath = "/resources/images/item";

		String folderPath = req.getSession().getServletContext().getRealPath(webPath);
		
		int boardNo = service.inquireWrite(paramMap, imageList, webPath, folderPath);
		
		String path = null;
		String message = null;
		
		if(boardNo>0) { // 게시글 등록 성공
			path="/member/inquireList?memberNo="+loginMember.getMemberNo();
			message = "문의가 등록되었습니다.";
		}else {
			path = req.getHeader("referer");
			message = "문의 등록 실패...";
		}
		ra.addFlashAttribute("message",message);
		
		return "redirect:"+path;
	}
	
	// 본인이 쓴 문의글 리스트 조회
	@GetMapping("/inquireList")
	public String inquireWrite() {
		
		
		return "member/inquireList";
	}
		

	// 상품관리 페이지
	@GetMapping("/itemManage")
	public String manage() {

		return "member/itemManage";
	}

	// 아이디 찾기 페이지 전환
	@GetMapping("/findId")
	public String fingId() {
		return "/member/member-find-ID";
	}

	// 핸드폰 본인인증(아이디 찾기)
	@GetMapping("/phoneCheck")
	@ResponseBody
	public String sendSMS(@RequestParam("phone") String memberTel) {
		int randomNumber = (int) ((Math.random() * (9999 - 1000 + 1)) + 1000);

		service.certifiedPhoneNumber(memberTel, randomNumber);

		return Integer.toString(randomNumber);
	}

	// 아이디 찾기
	@PostMapping("/findId")
	public String findId(@ModelAttribute Member inputMember, Model model) {
		
		List<Member> findMemberList = service.findId(inputMember);
		
		String path = null;
		
		if(!findMemberList.isEmpty()) {
			path = "member/comfirmId";
			model.addAttribute("message", "본인인증 성공");
			model.addAttribute("findMemberList", findMemberList);

		
		}else {
			path = "member/member-find-ID";
			model.addAttribute("message", "회원정보가 일치하지 않습니다");
		}
		
		return path;
	}
	
	
	// 비밀번호 찾기 페이지 전환
	@GetMapping("/findPw")
	public String findPw() {
		return "/member/member-find-PW";
	}
	
	
	
	// 비밀번호 재설정 페이지 전환
	@GetMapping("/inputPw2")
	public String findPw2() {
		return "/member/inputPw2";
	}
	
	
	
	// 비밀번호 찾기
	@PostMapping("/inputPw2")
	public String findPw(@ModelAttribute Member inputMember, Model model) {
		
		String findMember = service.findPw(inputMember);
		
		String path = null;
		
		if(findMember != null) {
			
			model.addAttribute("message", "본인인증 성공");
			model.addAttribute("findMember", findMember);
			path = "/member/inputPw2";
		
		}else {
			path = "/member/member-find-PW";
			model.addAttribute("message", "회원정보가 일치하지 않습니다");
		}
		
		return path;
	}
	

	
	// 아이디 찾기에서 비밀번호 찾기 전환
	@GetMapping("/inputPw")
	public String idTofindPw() {
		
		return "/member/inputPw";
	}
	
	// 아이디에서 비밀번호 찾기
	@PostMapping("/inputPw")
	public String idTofindPw(@RequestParam("memberId") String memberId, Model model) {
		
		String searchId = service.searchId(memberId); 
		
		model.addAttribute("searchId", searchId);

		return "/member/inputPw";
	}
	
	
	// 비밀번호 재설정(아이디 찾기)
	@PostMapping("/resetPw")
	public String resetPw(@ModelAttribute Member inputMember, Model model, RedirectAttributes ra) {
		
		int result = service.resetPw(inputMember);
		
		String path = null;
		if(result > 0) {
			ra.addFlashAttribute("message", "비밀번호가 변경되었습니다.");
			path = "/member/login";
		
		} else {
			ra.addFlashAttribute("message", "비밀번호가 변경실패");
			path = "/member/findId";
		}
		
		return "redirect:" + path;
		
	}
	
	// 비밀번호 재설정(아이디 찾기)
	@PostMapping("/resetPw2")
	public String resetPw2(@ModelAttribute Member inputMember, Model model, RedirectAttributes ra) {
		
		int result = service.resetPw(inputMember);
		
		String path = null;
		
		if(result > 0) {
			ra.addFlashAttribute("message", "비밀번호가 변경되었습니다.");
			path = "/member/login";
		
		} else {
			ra.addFlashAttribute("message", "비밀번호가 변경실패");
			path = "/member/findId";
		}
		
		return "redirect:" + path;
		
	}
	
	
}

























