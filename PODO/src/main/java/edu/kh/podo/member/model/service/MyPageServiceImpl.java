package edu.kh.podo.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.podo.member.model.dao.MyPageDAO;

@Service
public class MyPageServiceImpl {
	
	@Autowired
	private MyPageDAO dao;

}
