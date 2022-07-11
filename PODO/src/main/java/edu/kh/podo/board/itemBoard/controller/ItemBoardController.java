package edu.kh.podo.board.itemBoard.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.annotation.RequestScope;

import edu.kh.podo.board.itemBoard.model.service.ItemBoardService;
import edu.kh.podo.member.model.vo.Member;

@Controller
@RequestMapping("/board")
@SessionAttributes({"loginMember"})
public class ItemBoardController {
	@Autowired
	private ItemBoardService service;
	
	@GetMapping("/write")
	public String boardWriteForm() {
		
		return "member/itemUpload";
	}
	
	@PostMapping("/write")
	public String boardWrite(@ModelAttribute("loginMember") Member loginMember,
							@RequestParam Map<String,Object> itemMap
							) {
		
		
		
		
		return null;
	}

	
}
