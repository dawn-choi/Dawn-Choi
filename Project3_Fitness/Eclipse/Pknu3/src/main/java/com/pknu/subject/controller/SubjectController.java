package com.pknu.subject.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pknu.subject.service.SubjectSerivce;
import com.pknu.subject.vo.SubjectVo;
import com.pknu.users.vo.UsersVo;

@Controller
public class SubjectController {
	
	@Autowired
	private SubjectSerivce subjectService;
	
	@RequestMapping("/Subject/List")
	public ModelAndView subjectList( HttpServletRequest request,
			@RequestParam HashMap<String, Object> map ) {
				
		HttpSession session = request.getSession();
		
		UsersVo login = (UsersVo) session.getAttribute("login");
		
		map.put("mId", login.getMid());
		
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
		mv.addObject("mId", login.getMid());
		mv.addObject("pId", map.get("pId"));

		
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
		
		
		subjectService.setRegister(map);
		
		
		if(map.get("oCode") == null || map.get("oMsg") == null) {
			
			map.put("oCode", "Success");
			map.put("oMsg", "신청을 성공하셨습니다.");
		
		}
		
		System.out.println("????" + map);
			
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("oCode", map.get("oCode"));
		mv.addObject("oMsg", map.get("oMsg"));
		mv.addObject("pId", map.get("pId"));
		
		mv.setViewName("redirect:/Subject/List");
		
		return mv;

	}
	
	@RequestMapping("/Subject/ticketPage")
	public ModelAndView ticketPage(
			HttpServletRequest request,
			@RequestParam HashMap<String, Object> map) {
		
		HttpSession session = request.getSession();
		
		UsersVo login = (UsersVo) session.getAttribute("login");
		
		map.put("mId", login.getMid());
		
		System.out.println("티켓 페이지 : " + map);
		ModelAndView mv = new ModelAndView();
		mv.addObject("map", map);
		mv.setViewName("/register/ticketPage");
		
		return mv;
	}
	
	@RequestMapping("/Subject/ticketList")
	public ModelAndView ticketList(
			HttpServletRequest request,
			@RequestParam HashMap<String, Object> map) {
		
		HttpSession session = request.getSession();
		
		UsersVo login = (UsersVo) session.getAttribute("login");
		
		map.put("mId", login.getMid());
		
		List<SubjectVo> grSelect = subjectService.getGrSelect(map);
		
		List<SubjectVo> ticketList = subjectService.getTicketList(map);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("grSelect", grSelect);
		mv.addObject("ticketList", ticketList);
		mv.addObject("mId", login.getMid());
		mv.setViewName("/register/ticketList");
		
		return mv;
	}
	
	
	@RequestMapping("/Ticket/ClassList")
	@ResponseBody
	public List<SubjectVo> classList(
			@RequestParam HashMap<String, Object> map){
		
		List<SubjectVo> classSelect = subjectService.getClassSelect(map);
		
		return classSelect;
		
	}
	
	@RequestMapping("/Ticket/TermList")
	@ResponseBody
	public List<SubjectVo> termList(
			@RequestParam HashMap<String, Object> map){
		
		List<SubjectVo> termSelect 	= subjectService.getTermSelect(map);
		
		return termSelect;
		
	}
	
	@RequestMapping("/Ticket/Charge")
	@ResponseBody
	public HashMap<String, Object> ticketCharge(
			@RequestParam HashMap<String, Object> map) {
		
		subjectService.getTicket(map);
		
		System.out.println("!!!!!!!!!!!" + map);
		
		return map;
		
	}
	
	@RequestMapping("/Ticket/TicketList")
	@ResponseBody
	public List<SubjectVo> ticketChangeList(
			@RequestParam HashMap<String, Object> map) {
		
		List<SubjectVo> ticketList = subjectService.getTicketList(map);
		
		return ticketList;
		
	}
	
	@RequestMapping("/maps")
	public String toMap() {
		 
		return "/map/maps";
	}
	
	@RequestMapping("/getDirection")
	@ResponseBody
	public void getDirection(String departure, String arrival,
			HttpServletResponse response	) {
		
		String json = subjectService.getDirection(departure, arrival);
		
		System.out.println("JSON : " + json);
		
		try {
			response.getWriter().print(json);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
