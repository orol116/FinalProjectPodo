package edu.kh.podo.member.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.podo.member.model.dao.MyPageDAO;

@Service
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	private MyPageDAO dao;

	// 회원 정보 수정 Service 구현
	@Override 
	public int updateInfo(Map<String, Object> paramMap) {
		return dao.updateInfo(paramMap);
	}
 
	
	

}
