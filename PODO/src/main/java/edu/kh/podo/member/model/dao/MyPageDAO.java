package edu.kh.podo.member.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.podo.board.itemBoard.model.vo.ItemBoard;
import edu.kh.podo.member.model.vo.Member;
import edu.kh.podo.member.model.vo.MemberArea;

@Repository
public class MyPageDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 회원 정보 수정 DAO
	 * @param paramMap
	 * @return result
	 */
	public int updateInfo(Map<String, Object> paramMap) {
		return sqlSession.update("myPageMapper.updateInfo", paramMap);
	}

	/** 회원 비밀번호 변경 DAO
	 * @param pwMap
	 * @return result
	 */
	public int updatePw(Map<String, Object> pwMap) {
		return sqlSession.update("myPageMapper.updatePw", pwMap);
	}

	/** 현재 비밀번호 조회 DAO
	 * @param memberNo
	 * @return currentPw
	 */
	public String selectCurrentPw(int memberNo) {
		return sqlSession.selectOne("myPageMapper.selectCurrentPw", memberNo);
	}

	/** 회원 탈퇴 DAO
	 * @param memberNo
	 * @return result
	 */
	public int secession(int memberNo) {
		return sqlSession.update("myPageMapper.secession", memberNo);
	}

	/** 찜 상품 조회 DAO
	 * @param memberNo
	 * @return favorList
	 */
	public List<ItemBoard> selectFavorList(int memberNo) {
		return sqlSession.selectList("myPageMapper.selectFavorList", memberNo);
	}

	
	/** 주소 변경
	 * @param crdntMap
	 * @return result
	 */
	public int resetAddr(Map<String, Object> crdntMap) {
		return sqlSession.update("myPageMapper.resetAddr", crdntMap);
	}

	
	/** 위도 경도 변경
	 * @param crdntMap
	 * @return result
	 */
	public int resetCrdnt(Map<String, Object> crdntMap) {
		return sqlSession.update("myPageMapper.resetCrdnt", crdntMap);
	}

	
	/** 거리 등록
	 * @param distance
	 * @return result
	 */
	public int insertDist(MemberArea distance) {
		
		return sqlSession.insert("myPageMapper.insertDist", distance);
	}

	/** 찜한 상품 삭제 DAO
	 * @param map
	 * @return result
	 */
	public int favDel(Map<String, Object> map) {
		return sqlSession.delete("myPageMapper.favDel", map);
	}
	

	

}
