package edu.kh.podo.item.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.kh.podo.item.model.service.ItemService;

@Controller
@RequestMapping("/item")
public class ItemController {

	private Logger logger = LoggerFactory.getLogger(ItemController.class);
	
	@Autowired
	private ItemService service;
	
	// 상품 상세페이지
	@GetMapping("/detail")
	public String itemDetail() {
		return "/item/item-detail";
	}
	
}
