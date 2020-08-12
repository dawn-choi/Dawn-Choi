package com.pknu.notice.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.pknu.notice.service.NoticeService;
import com.pknu.notice.vo.FilterVo;
import com.pknu.notice.vo.NoticeVo;


@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("/MBoard")
	public String mboard() {
		return "notice/mboard";
	}
	
	
	@RequestMapping(value = "/FilterList", produces = "application/text; charset=utf8")
	@ResponseBody
	public String FilterSelect(HttpServletResponse response) throws JsonProcessingException
	{
		List<FilterVo> list = noticeService.getFilterList();
			
		ObjectMapper mapper = new ObjectMapper();
		
		String jsonStr = mapper.writeValueAsString(list);
		
		//System.out.println(jsonStr);
		
		return jsonStr;
	}
	
	@RequestMapping(value = "/NoticeList", produces = "application/text; charset=utf8")
	@ResponseBody
	public String NoticeList( @RequestParam HashMap<String, Object> map, HttpServletResponse response) throws JsonProcessingException
	{
		System.out.println(map);
		List<NoticeVo> list = noticeService.getList(map);
	
		// Jackson Library 
		// java 객체 -> Json 
		ObjectMapper mapper = new ObjectMapper();

		String jsonStr = mapper.writeValueAsString(list);

		System.out.println(jsonStr);
		
		return jsonStr;
				
	}
	
	// 세션에 저장된 현재 아이디를 들고 와야함
	// 작성 페이지에는 현재 아이디가 히든 INPUT에 기록되어 있어야함. 
	@RequestMapping("/NoticeWriteForm")
	public ModelAndView NoticeWriteForm(@RequestParam HashMap<String, Object>map)
	{
		
	    ModelAndView mv = new ModelAndView();
	    mv.addObject("map", map);
	    mv.setViewName("notice/writeform");

		return mv;
	}
	
	@RequestMapping("/testWrite")
	public String testWrite(@RequestParam HashMap<String, Object>map)
	{
		
	    System.out.println(map);

		return null;
	}
	
	
	@RequestMapping("/test")
	public String test()
	{
		
	   

		return "notice/test";
	}
	
}
