package edu.kh.podo.member.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import edu.kh.podo.board.itemBoard.model.vo.ItemBoard;

public class MyShopDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 내 판매상품 조회 DAO
	 * @return
	 */
	public List<ItemBoard> selectMyShop(int memberNo) {
		return sqlSession.selectList("myShopMapper.selectMyShop", memberNo);
	}

}
