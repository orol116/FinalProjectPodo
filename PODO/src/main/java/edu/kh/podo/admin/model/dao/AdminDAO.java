package edu.kh.podo.admin.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.podo.admin.model.vo.Admin;
import edu.kh.podo.board.itemBoard.model.vo.ItemBoard;
import edu.kh.podo.board.itemBoard.model.vo.Pagination;
import edu.kh.podo.member.model.vo.Member;

@Repository
public class AdminDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	


	public int inquiryListCount() {
		return sqlSession.selectOne("adminMapper.inquiryListCount");
	}

	public int itemListCount() {
		return sqlSession.selectOne("adminMapper.itemListCount");
	}

	public int memberListCount() {
		return sqlSession.selectOne("adminMapper.memberListCount");
	}
	public int reportListCount() {
		return sqlSession.selectOne("adminMapper.reportListCount");
	}
	
	public int FAQListCount() {
		return sqlSession.selectOne("adminMapper.FAQListCount");
	}
	
	
	// 관리자 1대1문의 게시글 수
	public int searchAdminListCount(Map<String, Object> paramMap) {
		
		int boardCode = (int) paramMap.get("boardCode");
		
		if(boardCode == 3) {
			return sqlSession.selectOne("adminMapper.searchAdminListCount",paramMap);
			
		}else if(boardCode ==4) {
			
			return sqlSession.selectOne("adminMapper.searchItemListCount",paramMap);
		}else if(boardCode == 5){
			
			return sqlSession.selectOne("adminMapper.searchMemberListCount",paramMap);
		}else if(boardCode == 6){
			
			return sqlSession.selectOne("adminMapper.searchReportListCount",paramMap);
		}else {
			
			return sqlSession.selectOne("adminMapper.searchAdminListCount",paramMap);
		}
		
	
	}

	
	// ADMIN 목록조회
	public List<Admin> selectInquiryList(Pagination pagination, int boardCode) {
		
		int offset = (pagination.getCurrentPage()-1)*pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("adminMapper.selectInquiryList", boardCode, rowBounds);
	}


	public List<ItemBoard> selectItemList(Pagination pagination, int boardCode) {
		int offset = (pagination.getCurrentPage()-1)*pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("adminMapper.selectItemList", boardCode, rowBounds);
	}
	
	public List<Member> selectMemberList(Pagination pagination, int boardCode) {
		int offset = (pagination.getCurrentPage()-1)*pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("adminMapper.selectMemberList", boardCode, rowBounds);
	}
	
	
	
	
	// ADMIN 검색 목록 조회
	public List<Member> searchMemberList(Pagination pagination, Map<String, Object> paramMap) {
		int offset = (pagination.getCurrentPage()-1)*pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("adminMapper.searchMemberList", paramMap, rowBounds);
	}
	
	
	public List<Admin> searchInquiryList(Pagination pagination, Map<String, Object> paramMap) {
		
		int offset = (pagination.getCurrentPage()-1)*pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("adminMapper.searchInquiryList", paramMap, rowBounds);
	}
	
	
	public List<ItemBoard> searchItemList(Pagination pagination, Map<String, Object> paramMap) {
		int offset = (pagination.getCurrentPage()-1)*pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("adminMapper.searchItemList", paramMap, rowBounds);
	}
	
	
	public List<Admin> searchReportList(Pagination pagination, Map<String, Object> paramMap) {
		int offset = (pagination.getCurrentPage()-1)*pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("adminMapper.searchReportList", paramMap, rowBounds);
	}
	


	
	
	// 관리자 게시물 작성 
	public int insertBoard(Map<String, Object> paramMap) {
		
		int result = sqlSession.insert("adminMapper.insertBoard",paramMap); // 0 또는 1
		
		if(result>0) {
			
			result = (int) paramMap.get("boardNo"); // 게시글 삽입 성공시 <selectKey> 태그를 이용해 세팅된 boardNo값을 반환함
										  // -> 게시글 번호 사용 가능해짐!
		}
		
		return result;	
	}

	/** 관리자 게시판 게시글 삭제
	 * @param boardCode 
	 * @param deleteValue
	 * @return
	 */
	public int adminDelete(String deleteNo, int boardCode) {
		
		int resultD=0;
		int result=0;
		
		Map<String, Object> map = new HashMap<String, Object>(); 
		
		map.put("deleteNo",deleteNo);
		map.put("boardCode",boardCode);
		
		if(boardCode == 5) {
			
			result  = sqlSession.update("adminMapper.memberSecession",map); 
			
		}else {
			
			result  = sqlSession.delete("adminMapper.adminImgDelete",map); // 0 또는 1
			
			resultD = sqlSession.delete("adminMapper.adminDelete",map); 
		}
		
		
		
		return resultD;
	}

	/** 사용자가 조회할 FAQ 게시글 불러오기 
	 * @param boardCode
	 * @return
	 */
	public List<Admin> faqList(String classification) {
		return sqlSession.selectList("adminMapper.faqList",classification);
	}

	



	

	

	
}
