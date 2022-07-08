package edu.kh.podo.chat.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.podo.chat.model.dao.ChatDAO;

@Service
public class ChatServiceImpl implements ChatService {
	
	@Autowired
	private ChatDAO dao;

}
