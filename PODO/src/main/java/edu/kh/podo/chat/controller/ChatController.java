package edu.kh.podo.chat.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

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

}
