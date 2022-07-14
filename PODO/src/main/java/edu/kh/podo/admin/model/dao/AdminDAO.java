package edu.kh.podo.admin.model.dao;

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

	

	

	
}
