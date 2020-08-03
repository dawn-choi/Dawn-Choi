package com.pknu.board.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pknu.board.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/")
	public String home() {
		return "home";
	}
	
	@RequestMapping("/Table")
	public String sidebar() {
		return "table";
	}
	
}
