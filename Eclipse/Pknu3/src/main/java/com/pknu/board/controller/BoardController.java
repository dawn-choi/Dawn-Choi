package com.pknu.board.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pknu.board.service.BoardService;
import com.pknu.board.vo.BoardVo;



@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/")
	public String home() {
		return "home";
	}
	
	@RequestMapping("/Table")
	public ModelAndView table() {
       List<BoardVo> spBoardList = boardService.getList();
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("table");
		mv.addObject("spBoardList", spBoardList );
		return  mv;
	}
	
	
	
}
