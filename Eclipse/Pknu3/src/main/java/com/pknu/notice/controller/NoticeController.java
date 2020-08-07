package com.pknu.notice.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import com.pknu.notice.service.NoticeService;
import com.pknu.notice.vo.NoticeVo;


public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("/NoticeList")
	
	public String NoticeList(HttpServletResponse response)
	{
		
				
				

				
				
				
		
		
		return null;
	}
}
