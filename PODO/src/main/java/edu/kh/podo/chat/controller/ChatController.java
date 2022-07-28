package edu.kh.podo.chat.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import edu.kh.podo.chat.model.service.ChatService;
import edu.kh.podo.chat.model.vo.ChatList;
import edu.kh.podo.chat.model.vo.ChatRoom;
import edu.kh.podo.member.model.vo.Member;

@Controller
@SessionAttributes({"loginMember", "chatRoomNo"})
public class ChatController {
	
	@Autowired
	private ChatService service;
	
	// 채팅방 목록 조회
	@GetMapping("/chat/roomList")
	public String podoTalkMain(@ModelAttribute("loginMember") Member loginMember
							 , Model model) {
		
		List<ChatList> chatRoomList = service.selectChatRoomList(loginMember.getMemberNo());
		
		model.addAttribute("chatRoomList", chatRoomList);
		
		return "/member/podoTalk";
	}
	
	// 채팅방 상세조회 ajax
	@GetMapping("/chat/chatDetail")
	@ResponseBody
	public String chatDetail(Model model
						   , int chatNo
						   , @ModelAttribute("loginMember") Member loginMember) {
		return new Gson().toJson(service.selectChatDetail(loginMember.getMemberNo(), chatNo));
	}
	
	// 후기 모달
	@GetMapping("/member/reviewWrite")
	public String reviewWrite(@ModelAttribute("loginMember") Member loginMember) {
		
		return "member/review-write";
		
		
	}
	
	// 채팅방 내 후기 작성 ajax
	@GetMapping("/chat/review")
	@ResponseBody
	public int writeReview(int memberNo, String reviewContent, int otherMemNo, int boardNo, String reviewCondition) {
		return service.writeReview(memberNo, reviewContent, otherMemNo, boardNo, reviewCondition);
	}
	
	// 1:1 채팅하기(채팅 생성)
	@GetMapping("/chat/start/{boardNo}/{sellMemberNo}")
	public String chatStart(@PathVariable("boardNo") int boardNo,
							@PathVariable("sellMemberNo") int sellMemberNo
						  , @ModelAttribute("loginMember") Member loginMember
						  , RedirectAttributes ra) {
		
		int myMemberNo = loginMember.getMemberNo();
		
		int chatNo = service.startChat(sellMemberNo, myMemberNo, boardNo);
		
		ra.addFlashAttribute("createChatNo", chatNo);
		return  "redirect:/chat/roomList"; 
	}
	
	// 채팅방 삭제(나가기)
	@GetMapping("/chat/deleteChat")
	@ResponseBody
	public int deleteChat(int chatNo) {
		return service.deleteChat(chatNo);
	}
	
	// 리뷰 작성 모달
	@GetMapping("/loginModal")
    public String loginModal() {
        return "member/loginModal";
    }

}
