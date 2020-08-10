package com.pknu.notice.controller;

import java.util.HashMap;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.pknu.notice.service.NoticeService;
import com.pknu.notice.vo.FilterVo;
import com.pknu.notice.vo.NoticeVo;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("/FilterList")
	public String FilterSelect(HttpServletResponse response) throws JsonProcessingException
	{
		List<FilterVo> list = noticeService.getFilterList();
		
		ObjectMapper mapper = new ObjectMapper();
		
		String jsonStr = mapper.writeValueAsString(list);
		
		System.out.println(jsonStr);
		
		return jsonStr;
	}
	
	@RequestMapping("/NoticeList")
	public String NoticeList(HashMap<String, Object> map, HttpServletResponse response) throws JsonProcessingException
	{
		List<NoticeVo> list = noticeService.getList(map);
	
		// Jackson Library 
		// java 객체 -> Json 
		ObjectMapper mapper = new ObjectMapper();

		String jsonStr = mapper.writeValueAsString(list);

		System.out.println(jsonStr);
		
		
		return jsonStr;
				

	}
}
