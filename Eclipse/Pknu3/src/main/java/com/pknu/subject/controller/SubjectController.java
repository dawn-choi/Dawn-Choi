package com.pknu.subject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SubjectController {
	
	@RequestMapping("/Subject/List")
	public ModelAndView subjectList() {
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/register/registerPage");
		
		return mv;
	}

}
