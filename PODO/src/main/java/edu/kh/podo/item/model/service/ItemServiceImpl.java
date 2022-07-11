package edu.kh.podo.item.model.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.podo.item.model.dao.ItemDAO;

@Service
public class ItemServiceImpl implements ItemService{

	@Autowired
	private ItemDAO dao;
	
	private Logger logger = LoggerFactory.getLogger(ItemServiceImpl.class);
}
