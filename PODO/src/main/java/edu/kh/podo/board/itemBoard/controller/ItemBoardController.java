package edu.kh.podo.board.itemBoard.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import java.net.http.HttpRequest;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import edu.kh.podo.board.itemBoard.model.service.ItemBoardService;
import edu.kh.podo.board.itemBoard.model.vo.ItemBoard;
import org.springframework.web.context.annotation.RequestScope;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.podo.member.model.vo.Member;

@Controller
@SessionAttributes({ "loginMember" })
public class ItemBoardController {
	@Autowired
	private ItemBoardService service;

	@GetMapping("/write")
	public String boardWriteForm() {

		return "member/itemUpload";
	}

	@PostMapping("/write")
	public String boardWrite(@ModelAttribute("loginMember") Member loginMember,
			@RequestParam(value = "images", required = false) List<MultipartFile> imageList, ItemBoard item,
			HttpServletRequest req) {

		item.setMemberNo(loginMember.getMemberNo());

		String webPath = "/resources/images/item";

		String folderPath = req.getSession().getServletContext().getRealPath(webPath);

		int boardNo = service.insertBoard(item, imageList, webPath, folderPath);

		return null;
	}

	// 상품 상세페이지
	@GetMapping("/board/detail")
	public String itemDetail() {
		return "/item/item-detail";
	}

	@GetMapping("")
	public String itemSearch(String searchBar, RedirectAttributes ra, Model model) {

		List<ItemBoard> searchList = service.searchBoard(searchBar);

		if (searchList != null) {

			model.addAttribute(searchList);
		}

		return "redirect:/";
	}

}
