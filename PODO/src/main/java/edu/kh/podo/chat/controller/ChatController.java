package edu.kh.podo.chat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

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
	public String podoTalkMain(@ModelAttribute("loginMember") Member loginMember, Model model) {
		
		List<ChatList> chatRoomList = service.selectChatRoomList(loginMember.getMemberNo());
		
		model.addAttribute("chatRoomList", chatRoomList);
		
		return "/member/podoTalk";
	}

}
