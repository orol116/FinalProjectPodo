package edu.kh.podo.member.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.podo.member.model.dao.NoteDAO;
import edu.kh.podo.member.model.vo.Member;
import edu.kh.podo.member.model.vo.Note;

@Service
public class NoteServiceImpl implements NoteService{

	@Autowired
	private NoteDAO dao;

	@Override
	public List<Note> selectNoteList(Member loginMember) {
		return dao.selectNoteList(loginMember);
	}
	
	
}
