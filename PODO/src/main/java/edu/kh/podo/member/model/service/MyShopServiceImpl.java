package edu.kh.podo.member.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import edu.kh.podo.board.itemBoard.model.vo.ItemBoard;
import edu.kh.podo.member.model.dao.MyShopDAO;

public class MyShopServiceImpl implements MyShopService {
	
	@Autowired
	private MyShopDAO dao;

	@Override
	public List<ItemBoard> selectMyShop(int memberNo) {
		return dao.selectMyShop(memberNo);
	}

}
