package com.pknu.subject.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
		
		System.out.println("맵 : "  + map);
		
		List<SubjectVo> subjectList = subjectService.getTotList(map); 
		List<SubjectVo> groupList	= subjectService.getGrList(map); 
		
		ModelAndView mv = new ModelAndView();
		
		if( !map.containsKey("oCode") || !map.containsKey("oMsg")) {
			map.put("oCode", " ");
			map.put("oMsg", " ");
		}
		
		mv.addObject("subjectList", subjectList);
		mv.addObject("groupList", groupList);
		mv.addObject("oCode", map.get("oCode"));
		mv.addObject("oMsg", map.get("oMsg"));		

		
		System.out.println("2번째 map : " + map);
		
		mv.setViewName("/register/registerPage");
		
		return mv;
	}
	
	@RequestMapping("/Subject/ListByFilter")
	@ResponseBody
	public List<SubjectVo> getSubjectByFilter( @RequestParam String grId ) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("grId", grId);
				
		List<SubjectVo> subjectList = subjectService.getSubjectByFilter(map); 
		
		return subjectList;
	}
	
	@RequestMapping("/Subject/ListBySearch")
	@ResponseBody
	public List<SubjectVo> getSubjectBySearch(@RequestParam HashMap<String, Object> map){
		/*
		 * HashMap<String, Object> map = new HashMap<String, Object>(); map.put("inNum",
		 * inNum);
		 */
		
		System.out.println(map);
		
		List<SubjectVo> subjectList = subjectService.getSubjectBySearch(map); 
		
		System.out.println(subjectList);
		
		return subjectList;
	}
	
	@RequestMapping("/Subject/Register")
	public ModelAndView register(
			@RequestParam HashMap<String, Object> map ) { 	//mid= &lId= 
		
		//임의로 멤버 아이디를 넣고 테스트
		map.put("mId", "test");
		
		subjectService.setRegister(map);
		
		System.out.println(map);
		
		if(map.get("oCode") == null || map.get("oMsg") == null) {
			
			map.put("oCode", "Success");
			map.put("oMsg", "신청을 성공하셨습니다.");
		
		}
		
		System.out.println("????" + map);
			
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("oCode", map.get("oCode"));
		mv.addObject("oMsg", map.get("oMsg"));
		
		
		mv.setViewName("redirect:/Subject/List");
		
		return mv;

	}

}
