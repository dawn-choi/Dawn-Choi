package com.pknu.notice.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 밑은 따로 아파치 버전을 받아야함 일단 제외 
//import org.apache.commons.lang3
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.pknu.notice.service.NoticeService;
import com.pknu.notice.vo.FilterVo;
import com.pknu.notice.vo.NoticeVo;
import com.pknu.notice.vo.SmarteditorVo;


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
	public ModelAndView testWrite(@RequestParam HashMap<String, Object>map)
	{
		System.out.println(map);
		
	    ModelAndView mv = new ModelAndView();
	    mv.addObject("map", map);
	    mv.setViewName("notice/content");
	    
		return mv;
	}
	
	
	@RequestMapping("/test")
	public String test()
	{
		
	   

		return "notice/test";
	}
	
	
	//======================================에디터 파일 처리 
	@RequestMapping(value = "/singleImageUploader.do")
	public String simpleImageUploader(
			HttpServletRequest req, SmarteditorVo smarteditorVo
			) throws IllegalStateException, IOException 
	{
		String callback_func = smarteditorVo.getCallback_func();
		String callback = smarteditorVo.getCallback();
		String file_result = "";
		String result = "";
		
		MultipartFile multiFile = smarteditorVo.getFiledata();
		
		if(multiFile != null && multiFile.getSize() > 0 &&
				StringUtils.isEmpty(multiFile.getName()) != true)
		{
			if(multiFile.getContentType().toLowerCase().startsWith("image/")) {
				String oriName = multiFile.getName();
				String uploadPath = req.getServletContext().getRealPath("/img");
				String path = uploadPath + "/smarteditor/";
				File file = new File(path);
				if(!file.exists()) {
					file.mkdir();
				}
				String fileName = UUID.randomUUID().toString();
				smarteditorVo.getFiledata().transferTo(new File(path + fileName));
				file_result += "&bNewLine=true&sFileName=" + oriName + 
         			   "&sFileURL=/img/smarteditor/" + fileName;
		}else{
			file_result += "&errstr=error";
		}
	}else{
		file_result += "&errstr=error";
	}
 
		result = "redirect:" + callback + 
		 "?callback_func=" + URLEncoder.encode(callback_func,"UTF-8") + file_result;
		return result;
			}
		}
	
