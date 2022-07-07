package edu.kh.podo.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.podo.admin.model.dao.AdminDAO;
import edu.kh.podo.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDAO dao;

	@Override
	public List<Member> selectMemberList() {
		return dao.selectMemberList();
	}
	
}
