package edu.kh.podo.board.itemBoard.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.podo.board.itemBoard.model.vo.BoardImage;
import edu.kh.podo.board.itemBoard.model.vo.Coordinate;
import edu.kh.podo.board.itemBoard.model.vo.ItemBoard;
import edu.kh.podo.member.model.vo.Member;

@Repository
public class ItemBoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	private Logger logger = LoggerFactory.getLogger(ItemBoardDAO.class);

	
	public List<ItemBoard> searchBoard(String query) {

		List<ItemBoard> searchList = sqlSession.selectList("itemBoardMapper.searchBoard", query);

		return searchList;

	}
	 

	public int insertBoard(ItemBoard item) {
		
		int result = sqlSession.insert("itemBoardMapper.insertBoard", item);
		
		if(result>0) {
			
			Coordinate crdnt = item.getCoordinate();
			crdnt.setBoardNo(item.getBoardNo());
			
			int result2 = sqlSession.insert("itemBoardMapper.insertCoordinate", crdnt);
			
			if(result2>0) {
				result = item.getBoardNo();
			}
		}
		
		return result;

	}

	/** 메인화면 상품 조회 DAO
	 * @return itemList
	 */
	public List<ItemBoard> selectitemList() {
		return sqlSession.selectList("itemBoardMapper.selectItemList");
	}
	
	/** 메인화면 상품 썸네일 조회 DAO
	 * @return itemList
	 */
	public List<BoardImage> selectItemsImg() {
		return sqlSession.selectList("itemBoardMapper.selectItemsImg");
	}
	
	
	/**해당 보드 넘버로부터 뒤의 4개의게시물 가져오기
	 * @param boardNo
	 * @return
	 */
	public List<ItemBoard> selectitemFor(int boardNo) {
		return sqlSession.selectList("itemBoardMapper.selectitemFor", boardNo);
	}

	/** 해당 보드 넘버로부터 뒤의 4개의 게시물 중 이미지 레벨 0번 이미지 조회
	 * @param boardNo
	 * @return
	 */
	public List<BoardImage> selectItemsFor(int boardNo) {
		return sqlSession.selectList("itemBoardMapper.selectItemsFor", boardNo);
	}

	
	
	
	public int insertBoardImageList(List<BoardImage> boardImageList) {
		return sqlSession.insert("itemBoardMapper.insertBoardImageList",boardImageList);
	}

	/** 판매글 상세조회 DAO
	 * @param boardNo
	 * @return itemList
	 */
	public List<ItemBoard> selectItem(int boardNo) {
		return sqlSession.selectList("itemBoardMapper.selectItem", boardNo);
	}

	/** 판매글에 해당하는 회원 번호 조회 DAO
	 * @param boardNo
	 * @return memberNo
	 */
	public int selectMemberNo(int boardNo) {
		return sqlSession.selectOne("itemBoardMapper.selectMemberNo", boardNo);
	}


	/** 판매자 다른 상품 보기 DAO
	 * @param daoMap
	 * @return sellList
	 */
	public List<ItemBoard> selectOtherItems(Map<String, Object> daoMap) {
		return sqlSession.selectList("itemBoardMapper.selectOtherItems", daoMap);
	}
	
	/** 판매자 다른 상품 이미지 보기 DAO
	 * @param daoMap
	 * @return sellList
	 */
	public List<BoardImage> selectOtherItemsImg(Map<String, Object> daoMap) {
		return sqlSession.selectList("itemBoardMapper.selectOtherItemsImg", daoMap);
	}

	/** 회원 정보 조회 DAO
	 * @param memberNo
	 * @return sellMember
	 */
	public List<Member> sellMemberInfo(int memberNo) {
		return sqlSession.selectList("itemBoardMapper.sellMemberInfo", memberNo);
	}

	/** 찜 등록 DAO
	 * @param map
	 * @return result
	 */
	public int addFav(Map<String, Object> map) {
		return sqlSession.insert("itemBoardMapper.addFav", map);
	}

	/** 찜 개수 +1 DAO
	 * @return result
	 */
	public int addCountAdd(Map<String, Object> map) {
		return sqlSession.update("itemBoardMapper.addCountAdd", map);
	}

	/** 게시글 상세조회 이미지 조회 DAO
	 * @param boardNo
	 * @return list
	 */
	public List<BoardImage> selectBoardImageList(int boardNo) {
		return sqlSession.selectList("itemBoardMapper.selectBoardImageList", boardNo);
	}

	/** 게시글 수정 DAO
	 * @param item
	 * @return result
	 */
	public int updateBoard(ItemBoard item) {
		return sqlSession.update("itemBoardMapper.updateBoard", item);
	}


	/** 게시글 이미지 1개 수정
	 * @param img
	 * @return result
	 */
	public int updateBoardImage(BoardImage img) {
		return sqlSession.update("itemBoardMapper.updateBoardImage", img);
	}

	/** 게시글 이미지 1개 삽입
	 * @param img
	 * @return result
	 */
	public int insertBoardImage(BoardImage img) {
		return sqlSession.insert("itemBoardMapper.insertBoardImage", img);
	}

	/** 수정용 상세조회
	 * @param boardNo
	 * @return item
	 */
	public ItemBoard selectBoardDetail(int boardNo) {
		return sqlSession.selectOne("itemBoardMapper.selectBoardDetail", boardNo);
	}
	
	/** 게시글 이미지 삭제 DAO
	 * @param map
	 * @return result
	 */
	public int deleteBoardImage(Map<String, Object> map) {
		return sqlSession.delete("itemBoardMapper.deleteBoardImage", map);
	}


	public List<ItemBoard> selectDate() {
		
		return sqlSession.selectList("itemBoardMapper.selectDate");
	}

	/** 조회수 증가 DAO
	 * @param boardNo
	 * @return result
	 */
	public int updateReadCount(int boardNo) {
		return sqlSession.update("itemBoardMapper.updateReadCount", boardNo);
	}


	/** 거리별 상품 조회
	 * @param loginMember
	 * @return distList
	 */
	public List<ItemBoard> selectDistList(Map<String, Object> distMap) {
		
		return sqlSession.selectList("itemBoardMapper.selectDistList", distMap);
	}



	

//	/** 판매자 다른 상품 이미지 조회 DAO
//	 * @param daoMap 
//	 * @return list
//	 */
//	public List<BoardImage> selectOtherImage(Map<String, Object> daoMap) {
//		return sqlSession.selectList("itemBoardMapper.selectOtherImage", daoMap);
//	}
}
