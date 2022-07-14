package edu.kh.podo.member.model.service;

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
	
	

}
