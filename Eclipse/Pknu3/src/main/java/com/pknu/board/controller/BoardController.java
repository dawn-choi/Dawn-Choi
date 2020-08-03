package com.pknu.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {

	@RequestMapping("/")
	public String home() {
		return "home";
	}
	
	@RequestMapping("/Table")
	public String sidebar() {
		return "table";
	}
	
}
