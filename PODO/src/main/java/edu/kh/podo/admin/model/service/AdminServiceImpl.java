package edu.kh.podo.admin.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.podo.admin.model.dao.AdminDAO;
import edu.kh.podo.admin.model.vo.Admin;
import edu.kh.podo.board.itemBoard.model.vo.ItemBoard;
import edu.kh.podo.board.itemBoard.model.vo.Pagination;
import edu.kh.podo.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDAO dao;

	

	@Override
	public Map<String, Object> inquiryList(int cp, int boardCode) {
		
		int listCount =0;
		
		if(boardCode == 3) {
			
			listCount = dao.inquiryListCount();
		}else if(boardCode ==4) {
			
			listCount = dao.itemListCount();
		}else if(boardCode ==5){
			
			listCount = dao.memberListCount();
		}else if(boardCode ==6){
			
			listCount = dao.reportListCount();
		}else {
			
			listCount = dao.FAQListCount();
		}
		
		
		Pagination pagination = new Pagination(cp, listCount);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("pagination", pagination);
		
		
		if(boardCode == 3) {
			
			List<Admin> InquiryList = dao.selectInquiryList(pagination, boardCode);
			map.put("InquiryList", InquiryList);
		}else if(boardCode ==4) {
			
			List<ItemBoard> itemList = dao.selectItemList(pagination, boardCode);
			map.put("itemList", itemList);
		}else if(boardCode == 5){
			
			List<Member> memberList = dao.selectMemberList(pagination, boardCode);
			map.put("memberList", memberList);
		}else if(boardCode == 6){
			
			List<Admin> reportList = dao.selectInquiryList(pagination, boardCode);
			map.put("reportList", reportList);
		}else {
			
			List<Admin> FAQList = dao.selectInquiryList(pagination, boardCode);
			map.put("FAQList", FAQList);
		}
		
		return map;
	}
	
}
