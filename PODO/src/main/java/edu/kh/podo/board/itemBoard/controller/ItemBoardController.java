package edu.kh.podo.board.itemBoard.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import edu.kh.podo.board.itemBoard.model.service.ItemBoardService;
import edu.kh.podo.board.itemBoard.model.vo.BoardImage;
import edu.kh.podo.board.itemBoard.model.vo.Coordinate;
import edu.kh.podo.board.itemBoard.model.vo.ItemBoard;
import edu.kh.podo.common.Util;
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
	
	@GetMapping("/member/updateBoard/{boardNo}")
	public String boardUpdateForm(@PathVariable("boardNo") int boardNo
								, Model model) {
		
		ItemBoard item = service.selectBoardDetail(boardNo);
		item.setBoardContent(Util.newLineClear(item.getBoardContent()));
		model.addAttribute("item", item);
		
		List<BoardImage> boardImageList = service.selectBoardImageList(boardNo);
		model.addAttribute("boardImageList", boardImageList);
		
		
		return "member/itemUpload";
	}
		

	// 게시글 작성
	@PostMapping("/board/itemUpload")
	public String boardWrite(@ModelAttribute("loginMember") Member loginMember,
							@RequestParam(value="images", required=false) List<MultipartFile> imageList,
							ItemBoard item,
							Coordinate crdnt,
							HttpServletRequest req,
							RedirectAttributes ra,
							@RequestParam(value="mCateValue", required=false, defaultValue="1") int mCateValue,
							@RequestParam(value="placeResult", required=false) String sellArea
							) throws IOException {

		item.setMemberNo(loginMember.getMemberNo());
		item.setCategoryNo(mCateValue);
		item.setSellArea(sellArea);
		
		
		System.out.println(crdnt);
//		item.setCategoryNo(Integer.parseInt(mCateValue.substring(1)));
		
		String webPath = "/resources/images/items";

		String folderPath = req.getSession().getServletContext().getRealPath(webPath);
		int boardNo = service.insertBoard(item, imageList, webPath, folderPath, crdnt);
		
		String path = null;
		String message = null;
		
		if(boardNo > 0) { // 게시글 등록 성공
			path="../board/detail/"+boardNo;
			message = "게시글이 등록되었습니다.";
		}else {
			path = req.getHeader("referer");
			message = "게시글삽입 실패...";
		}
		ra.addFlashAttribute("message", message);
		
		return "redirect:" + path;
			

	}	
	
	// 게시글 수정
	@PostMapping("/board/updateBoard/{boardNo}")
	public String boardUpdate(@ModelAttribute("loginMember") Member loginMember,
							  @PathVariable("boardNo") int boardNo,
							  HttpServletRequest req,
							  ItemBoard item,
							  RedirectAttributes ra,
							  @RequestParam(value = "deleteList", required = false) String deleteList,
							  @RequestParam(value="images", required=false) List<MultipartFile> imageList
							  ) throws IOException {
		
		String webPath = "/resources/images/";
		String folderPath = req.getSession().getServletContext().getRealPath(webPath);
		
		int result = service.updateBoard(item, imageList, webPath, folderPath, deleteList);
		
		String path = null;
		String message = null;
		
		if (result > 0) {
			message = "게시글이 수정되었습니다.";
			path = "../board/detail/" + boardNo;
		} else {
			message = "게시글 수정 실패";
			path = req.getHeader("referer");
		}
		
		ra.addFlashAttribute("message", message);
		
			
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
	
	@ResponseBody
	@GetMapping("/myPlace")
	public String myPlaceSelect(int memberNo) {
		
		Map<String, Object> map = service.myPlaceSelect(memberNo);

		System.out.println(map);
		
		return new Gson().toJson(map);
	}

}
