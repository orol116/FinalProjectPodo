package edu.kh.podo.admin.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.podo.admin.model.dao.AdminDAO;
import edu.kh.podo.admin.model.vo.Admin;
import edu.kh.podo.admin.model.vo.AdminReply;
import edu.kh.podo.board.itemBoard.model.vo.ItemBoard;
import edu.kh.podo.board.itemBoard.model.vo.Pagination;
import edu.kh.podo.common.Util;
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



	@Override
	public int insertBoard(Map<String, Object> paramMap) {
		
		paramMap.put("boardTitle",Util.XSSHandling((String)paramMap.get("boardTitle")));
		paramMap.put("boardContent",Util.XSSHandling((String)paramMap.get("boardContent")));
		
		paramMap.put("boardContent",Util.newLineHandling((String)paramMap.get("boardContent")));
	
//		System.out.println(		paramMap.get("boardContent"));
//		System.out.println(paramMap.get("boardTitle"));

		int boardNo = dao.insertBoard(paramMap);
		
		return boardNo;
	}



	@Override
	public Map<String, Object> searchBoardList(Map<String, Object> paramMap) {
		
		int boardCode = (int) paramMap.get("boardCode");
		int listCount = dao.searchAdminListCount(paramMap);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		Pagination pagination = new Pagination((int)paramMap.get("cp"), listCount);

		
		if(boardCode == 3) {
			
			List<Admin> InquiryList = dao.searchInquiryList(pagination, paramMap);
			map.put("InquiryList", InquiryList);
		}else if(boardCode ==4) {
			
			List<ItemBoard> itemList = dao.searchItemList(pagination, paramMap);
			map.put("itemList", itemList);
		}else if(boardCode == 5){
			
			List<Member> memberList = dao.searchMemberList(pagination, paramMap);
			map.put("memberList", memberList);
		}else if(boardCode == 6){
			
			List<Admin> reportList = dao.searchReportList(pagination, paramMap);
			map.put("reportList", reportList);
		}else {
			
			List<Admin> FAQList = dao.searchInquiryList(pagination, paramMap);
			map.put("FAQList", FAQList);
		}
		
		map.put("pagination", pagination);
		
		return map;
	}


	//관리자 게시판 게시글 삭제
	@Override
	public int adminDelete(String deleteNo, int boardCode) {
		return dao.adminDelete(deleteNo, boardCode);
	}


	// FAQ 게시글 불러오기 
	@Override
	public List<Admin> faqList(String classification) {
		return dao.faqList(classification);
	}


	// 1대1 문의 답변 작성
	@Override
	public int adminReplyWrite(String boardContent, int boardNo) {
		return dao.adminReplyWrite(boardContent, boardNo);
	}

	// 1대1 문의 답변 조회
	@Override
	public List<AdminReply> selectAdminReply(int boardNo) {
		return dao.selectAdminReply(boardNo);
	}
	
}
