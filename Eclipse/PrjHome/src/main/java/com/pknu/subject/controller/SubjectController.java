package com.pknu.subject.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pknu.subject.service.SubjectSerivce;
import com.pknu.subject.vo.SubjectVo;

@Controller
public class SubjectController {
	
	@Autowired
	private SubjectSerivce subjectService;
	
	@RequestMapping("/Subject/List")
	public ModelAndView subjectList(
			@RequestParam HashMap<String, Object> map ) {
		
		List<SubjectVo> subjectList = subjectService.getTotList(map); 
		List<SubjectVo> groupList	= subjectService.getGrList(map); 
		
		System.out.println(groupList);
		
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("subjectList", subjectList);
		mv.addObject("groupList", groupList);
		
		mv.setViewName("/register/registerPage");
		
		return mv;
	}
	
	@RequestMapping("/Subject/Register")
	public ModelAndView register() {
		
		ModelAndView mv = new ModelAndView();
		
		return mv;

	}

}
