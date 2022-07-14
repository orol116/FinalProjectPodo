package edu.kh.podo.admin.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.podo.admin.model.dao.AdminDAO;
import edu.kh.podo.admin.model.vo.Admin;
import edu.kh.podo.board.itemBoard.model.vo.Pagination;
import edu.kh.podo.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDAO dao;

	@Override
	public List<Member> selectMemberList() {
		return dao.selectMemberList();
	}

	@Override
	public Map<String, Object> inquiryList(int cp) {
		
		int listCount = dao.inquiryListCount();
		
		Pagination pagination = new Pagination(cp, listCount);
		
		List<Admin> InquiryList = dao.selectInquiryList(pagination);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("pagination", pagination);
		map.put("InquiryList", InquiryList);
		
		return map;
	}
	
}
