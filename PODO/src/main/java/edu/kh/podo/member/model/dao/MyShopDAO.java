package edu.kh.podo.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.podo.board.itemBoard.model.vo.ItemBoard;
import edu.kh.podo.board.itemBoard.model.vo.Pagination;
import edu.kh.podo.member.model.vo.Member;
import edu.kh.podo.member.model.vo.Review;
import oracle.net.aso.b;

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

	/** 내 판매목록 조회 DAO
	 * @param pagination
	 * @param memberNo
	 * @return boardLIst
	 */
	public List<ItemBoard> selectManageItem(Pagination pagination, int memberNo) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		return sqlSession.selectList("myShopMapper.selectManageItem", memberNo, rowBounds);
	}

	/** 내 후기 개수 조회 DAO
	 * @param memberNo
	 * @return reviewCount
	 */
	public int selectReviewCount(int memberNo) {
		return sqlSession.selectOne("myShopMapper.selectReviewCount", memberNo);
	}

	/** 내 상점 소개 수정 DAO
	 * @param map
	 * @return
	 */
	public int introChange(Map<String, Object> map) {
		return sqlSession.update("myShopMapper.introChange", map);
	}

	/** 상품관리 판매상태 ajax
	 * @param map
	 * @return result
	 */
	public int changeTradeCondition(Map<String, Object> map) {
		return sqlSession.update("myShopMapper.changeTradeCondition", map);
	}

	/** 끌올 기능 ajax
	 * @param boardNo
	 * @return result
	 */
	public int updateDate(int boardNo) {
		return sqlSession.update("myShopMapper.updateDate", boardNo);
	}

	/** 구매/판매 내역 조회 ajax DAO
	 * @param map
	 * @return itemList
	 */
	public List<ItemBoard> selectList(Map<String, Object> map) {
		return sqlSession.selectList("myShopMapper.selectList", map);
	}

	public int selectFinItem(int memberNo) {
		return sqlSession.selectOne("myShopMapper.selectFinItem", memberNo);
	}

	public int selectMemberNo(int boardNo) {
		return sqlSession.selectOne("myShopMapper.selectMemberNo", boardNo);
	}

	
	public void updateGrape(int no) {
		sqlSession.update("myShopMapper.updateGrape", no);
	}

}
