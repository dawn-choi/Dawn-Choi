package com.pknu.schedule.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pknu.schedule.service.ScheduleService;
import com.pknu.schedule.vo.ScheduleVo;

@Controller
public class ScheduleController {
   
   @Autowired
   private ScheduleService scheduleService;
  
   @RequestMapping("/Schedule/ScheduleList")
   public ModelAndView scheduleList() {
      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("mid", "DPD123");
      List<ScheduleVo> scheduleList = scheduleService.getScheduleList(map);
      ArrayList<String> day = new ArrayList<>();
      ArrayList<String> time = new ArrayList<>();
      
      day.add("월");
      day.add("화");
      day.add("수");
      day.add("목");
      day.add("금");
      day.add("토");
      
      time.add("09:00");
      time.add("10:00");
      time.add("11:00");
      time.add("12:00");
      time.add("13:00");
      time.add("14:00");
      time.add("15:00");
      time.add("16:00");
      time.add("17:00");
      time.add("18:00");
      
      ModelAndView mv = new ModelAndView();
      
      mv.setViewName("schedule/scheduleList");
      mv.addObject("scheduleList", scheduleList);
      mv.addObject("time", time);
      mv.addObject("day", day);
      return  mv;
   }
   
   @RequestMapping("/Schedule/ScheduleView")
   public ModelAndView scheduleView(ScheduleVo vo) {
      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("mid", vo.getMid());
      map.put("lid", vo.getLid());
      map.put("pid", vo.getPid());
      System.out.println("ScheduleView: " + vo.getPid());
      List<ScheduleVo>  scheduleView = scheduleService.getScheduleView(map);
      
      System.out.println("scheduleView :" + scheduleView );
      
      ModelAndView mv = new ModelAndView();
      mv.setViewName("schedule/scheduleView");
      mv.addObject("schedule", scheduleView);
      return  mv;
   }
      
   @RequestMapping("/Schedule/ImpList")
   @ResponseBody
   public List<ScheduleVo> impList(ScheduleVo vo) { 
	  HashMap<String, Object> map = new HashMap<String, Object>();
	  map.put("pid", vo.getPid());
      System.out.println("con" + map); 
      
      List<ScheduleVo> impList = scheduleService.getImpList(map); 
      System.out.println("con impList:" + impList);
      return impList;
   }
}