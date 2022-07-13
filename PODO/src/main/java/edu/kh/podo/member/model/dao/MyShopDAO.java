package edu.kh.podo.member.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.podo.board.itemBoard.model.vo.ItemBoard;
import edu.kh.podo.member.model.vo.Member;
import edu.kh.podo.member.model.vo.Review;

@Repository
public class MyShopDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 판매자 판매상품 조회 DAO
	 * @param memberNo
	 * @return mySellList
	 */
	public List<ItemBoard> selectMemberShop(int memberNo) {
		return sqlSession.selectList("myShopMapper.selectMemberShop", memberNo);
	}

	/** 판매자 후기 조회 DAO
	 * @param memberNo
	 * @return reviewList
	 */
	public List<Review> selectMemberReview(int memberNo) {
		return sqlSession.selectList("myShopMapper.selectMemberReview", memberNo);
	}

	/** 내 상점 회원 정보 조회 DAO
	 * @param memberNo
	 * @return member
	 */
	public List<Member> selectMemberInfo(int memberNo) {
		return sqlSession.selectList("myShopMapper.selectMemberInfo", memberNo);
	}

	/** 내 상점 판매 상품 개수 조회 DAO
	 * @param memberNo
	 * @return boardCount
	 */
	public int selectBoardCount(int memberNo) {
		return sqlSession.selectOne("myShopMapper.selectBoardCount", memberNo);
	}

}
