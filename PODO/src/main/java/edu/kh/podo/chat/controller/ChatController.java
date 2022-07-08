package edu.kh.podo.chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.podo.chat.model.service.ChatService;

@Controller
@SessionAttributes({"loginMember", "chatRoomNo"})
public class ChatController {
	
	@Autowired
	private ChatService service;

}
