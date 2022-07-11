package edu.kh.podo.member.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.podo.board.itemBoard.model.vo.ItemBoard;
import edu.kh.podo.member.model.vo.Review;

@Repository
public class MyShopDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 내 판매상품 조회 DAO
	 * @param memberNo
	 * @return mySellList
	 */
	public List<ItemBoard> selectMemberShop(int memberNo) {
		return sqlSession.selectList("myShopMapper.selectMemberShop", memberNo);
	}

	/** 내 후기 조회 DAO
	 * @param memberNo
	 * @return reviewList
	 */
	public List<Review> selectMemberReview(int memberNo) {
		return sqlSession.selectList("myShopMapper.selectMemberReview", memberNo);
	}

}
