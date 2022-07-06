package edu.kh.podo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping("/note")
@SessionAttributes({"loginMember"})
public class NoteController {

	@GetMapping("*")
	public String noteList( ) {
		
		return null;
	}
	
	
}
