package edu.kh.podo.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;

import edu.kh.podo.member.model.service.NoteService;
import edu.kh.podo.member.model.vo.Member;
import edu.kh.podo.member.model.vo.Note;

@Controller
@SessionAttributes({"loginMember"})
public class NoteController {
	
	@Autowired
	private NoteService service;
	
	@GetMapping("/note")
	public String selectNoteList(Model model,
						   @ModelAttribute("loginMember") Member loginMember) {
		
		List<Note> nList = service.selectNoteList(loginMember);
		
		return new Gson().toJson(nList);
		
	}
	
}
