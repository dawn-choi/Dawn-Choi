package com.pknu.board.controller;


import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	
	@RequestMapping("/TableSelect")
	public ModelAndView tableSelect(
			@RequestParam HashMap<String,Object> map) {
		//{selone=1, seltwo=3}
		//{selone=0, seltwo=5}
		//System.out.println(map);
		List<BoardVo> spBoardList = boardService.getList2(map);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("table");
		mv.addObject("spBoardList", spBoardList );
		return  mv;
	}
	
	
	@RequestMapping("/TableMenu")
	public ModelAndView tableMenu(
			@RequestParam HashMap<String,Object> map) {
		//{selone=1, seltwo=3}
		//{selone=0, seltwo=5}
		//System.out.println(map);
		List<BoardVo> spBoardList = boardService.getList3(map);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("table");
		mv.addObject("spBoardList", spBoardList );
		return  mv;
	}
	
	
	
}
