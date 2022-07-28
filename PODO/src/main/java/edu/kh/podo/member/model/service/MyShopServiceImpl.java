package edu.kh.podo.member.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.podo.board.itemBoard.model.vo.ItemBoard;
import edu.kh.podo.board.itemBoard.model.vo.Pagination;
import edu.kh.podo.member.model.dao.MyShopDAO;
import edu.kh.podo.member.model.vo.Member;
import edu.kh.podo.member.model.vo.Review;

@Service
public class MyShopServiceImpl implements MyShopService {
	
	@Autowired
	private MyShopDAO dao;

	// 판매자 판매상품 조회 Service 구현
	@Override
	public List<ItemBoard> selectMemberShop(int memberNo) {
		return dao.selectMemberShop(memberNo);
	}

	// 판매자 후기 조회 Service 구현
	@Override
	public List<Review> selectMemberReview(int memberNo) {
		return dao.selectMemberReview(memberNo);
	}

	// 내 상점 회원 정보 조회 Service 구현
	@Override
	public List<Member> selectMemberInfo(int memberNo) {
		return dao.selectMemberInfo(memberNo);
	}

	// 내 상점 판매 상품 개수 조회 Service 구현
	@Override
	public int selectBoardCount(int memberNo) {
		return dao.selectBoardCount(memberNo);
	}

	// 내 판매목록 조회
	@Override
	public Map<String, Object> selectManageItem(Map<String, Object> map) {
		Pagination pagination = new Pagination((Integer.parseInt(map.get("cp").toString())), (Integer.parseInt(map.get("boardCount").toString())));
		
		List<ItemBoard> boardList = dao.selectManageItem(pagination, (Integer.parseInt(map.get("memberNo").toString())));
		
		map.put("pagination", pagination);
		map.put("boardList", boardList);
		
		return map;
	}

	// 내 후기 개수 조회
	@Override
	public int selectReviewCount(int memberNo) {
		return dao.selectReviewCount(memberNo);
	}

	// 내 상점 소개 수정 Service 구현
	@Override
	public int introChange(int memberNo, String report) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("report", report);
		
		return dao.introChange(map);
	}

	// 상품관리 판매상태 ajax
	@Override
	public int changeTradeCondition(Map<String, Object> map) {
		return dao.changeTradeCondition(map);
	}

	// 끌올 기능 ajax
	@Override
	public int updateDate(int boardNo) {
		
		int result = dao.updateDate(boardNo);
		
		if (result > 0) {
			int no = dao.selectMemberNo(boardNo);
			dao.updateGrape(no);
		}
		
		return result;
	}

	// 구매/판매 내역 조회 ajax Service 구현
	@Override
	public List<ItemBoard> selectList(int memberNo, int type) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("type", type);
		
		return dao.selectList(map);
	}

	@Override
	public int selectFinItem(int memberNo) {
		return dao.selectFinItem(memberNo);
	}
	
	

}
