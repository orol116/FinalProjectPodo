package edu.kh.podo.board.itemBoard.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import org.apache.velocity.runtime.directive.Parse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import edu.kh.podo.board.itemBoard.model.service.ItemBoardService;
import edu.kh.podo.board.itemBoard.model.vo.ItemBoard;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.podo.member.model.vo.Member;

@Controller
@SessionAttributes({"loginMember"})
public class ItemBoardController {
	
	@Autowired
	private ItemBoardService service;
	
	@GetMapping("/member/itemUpload")
	public String boardWriteForm() {
		
		return "member/itemUpload";
	}
		

	// 게시글 작성
	@PostMapping("/board/itemUpload")
	public String boardWrite(@ModelAttribute("loginMember") Member loginMember,
							@RequestParam(value="images", required=false) List<MultipartFile> imageList,
							ItemBoard item,
							HttpServletRequest req,
							RedirectAttributes ra,
							@RequestParam(value="mCateValue", required=false, defaultValue="1") int mCateValue
							) throws IOException {

		item.setMemberNo(loginMember.getMemberNo());
		item.setCategoryNo(mCateValue);
		
//		item.setCategoryNo(Integer.parseInt(mCateValue.substring(1)));
		
		String webPath = "/resources/images/item";

		String folderPath = req.getSession().getServletContext().getRealPath(webPath);
		

		int boardNo = service.insertBoard(item, imageList, webPath, folderPath);
		
		String path = null;
		String message = null;
			
		if(boardNo>0) { // 게시글 등록 성공
			path="../board/detail/"+boardNo;
			message = "게시글이 등록되었습니다.";
		}else {
			path = req.getHeader("referer");
			message = "게시글삽입 실패...";
		}
		ra.addFlashAttribute("message",message);
		
		return "redirect:" + path;

	}	
		
	// 상품 상세
	@GetMapping("/board/detail/{boardNo}")
	public String itemDetail(@PathVariable("boardNo") int boardNo
						   , Model model) {
		
		Map<String, Object> map = service.itemDetail(boardNo);
		map.put("boardNo", boardNo);
		
		model.addAttribute("map", map);

		return "/item/item-detail";
	}
	
	// 찜하기 버튼 ajax
	@ResponseBody
	@GetMapping("/board/addFav")
	public int addFav(int loginMemberNo
					, int boardNo) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("loginMemberNo", loginMemberNo);
		map.put("boardNo", boardNo);
		int result = 0;
		try {
			result = service.addFav(map);
			
			if (result > 0) {
				result = service.addCountAdd(map);
			} 
		} catch (Exception e) {}
		
		return result;
	}


}
