package com.d.todolist;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.d.todolist.service.TodoService;
import com.d.todolist.vo.Vo;

@Controller
public class HomeController {
	
	
	@Autowired private TodoService todoService;
	 
	
	@RequestMapping("/")
	public String home() {
	
		
		return "home";
	}
	@RequestMapping("/insertForm")
	public String insertForm() {
		return "/insertForm";
	}
	
	@RequestMapping(value="/ajax", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
	public List<Vo> ajax() {
	List<Vo> vo = (List<Vo>)todoService.getList();	
		/*
		 * ModelAndView mv = new ModelAndView(); if(vo.isEmpty()) {
		 * System.out.println("리스트 빔"); } mv.setViewName("home");
		 * mv.addObject("list",mv);
		 */
	   return vo;
	}
	
	@RequestMapping(value="/update", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
	public List<Vo> update(Vo vo) {
		HashMap<String, Object> map =new HashMap<String, Object>();
		map.put("ids",vo.getIds());
		todoService.update(map);
		System.out.println(map);
		List<Vo> vo2 = (List<Vo>)todoService.getList();	
		return vo2;
	}
	
	@RequestMapping("/insert")
	public String insert(@RequestParam HashMap<String, Object> map ) {
		
		todoService.insert(map);
		
		return "home";
	}
	
}
