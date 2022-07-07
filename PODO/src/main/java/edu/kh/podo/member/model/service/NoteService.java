package edu.kh.podo.member.model.service;

import java.util.List;

import edu.kh.podo.member.model.vo.Member;
import edu.kh.podo.member.model.vo.Note;

public interface NoteService {

	List<Note> selectNoteList(Member loginMember);

	
	
	
}
