package edu.kh.podo.member.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import edu.kh.podo.member.model.vo.Member;
import edu.kh.podo.member.model.vo.Note;

public class NoteDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Note> selectNoteList(Member loginMember) {
		return sqlSession.selectList("");
	}
	
}
