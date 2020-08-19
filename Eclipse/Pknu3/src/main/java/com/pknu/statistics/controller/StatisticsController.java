package com.pknu.statistics.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pknu.schedule.vo.ScheduleVo;
import com.pknu.statistics.service.StatisticsService;
import com.pknu.statistics.vo.StatisticsVo;

@Controller
public class StatisticsController {

	@Autowired
	private StatisticsService statisticsService;
	
	@RequestMapping("/info")
	public String info() {
		return "info";
	}
	
	@RequestMapping("/Statistics/AgeBarList")
	   @ResponseBody
	   public List<StatisticsVo> ageList(StatisticsVo vo) { 
		  HashMap<String, Object> map = new HashMap<String, Object>();
	      System.out.println("con" + map); 
	      
	      List<StatisticsVo> ageList = statisticsService.getAgeList(map); 
	      System.out.println("con ageList:" + ageList);
	      return ageList;
	   }
	
	@RequestMapping("/Statistics/GenList")
	   @ResponseBody
	   public List<StatisticsVo> genList(StatisticsVo vo) { 
		  HashMap<String, Object> map = new HashMap<String, Object>();
	      System.out.println("con" + map); 
	      
	      List<StatisticsVo> genList = statisticsService.getGenList(map); 
	      System.out.println("con genList:" + genList);
	      return genList;
	   }
	
	@RequestMapping("/Statistics/TrnList")
	   @ResponseBody
	   public List<StatisticsVo> trnList(StatisticsVo vo) { 
		  HashMap<String, Object> map = new HashMap<String, Object>();
	      System.out.println("con" + map); 
	      
	      List<StatisticsVo> trnList = statisticsService.getTrnList(map); 
	      System.out.println("con trnList:" + trnList);
	      return trnList;
	   }
	
	@RequestMapping("/Statistics/StatisticsList")
	public String statisticsList() {
		return "statistics/statisticsList";
	}
	


}
