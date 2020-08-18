package com.pknu.statistics.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pknu.statistics.service.StatisticsService;
import com.pknu.statistics.vo.StatisticsVo;

@Controller
public class StatisticsController {

	@Autowired
	private StatisticsService statisticsService;
	
	@RequestMapping("/Statistics/StatisticsList")
	public ModelAndView statisticsList(StatisticsVo vo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<StatisticsVo> statisticsList = statisticsService.getStatisticsList(map);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("statistics/statisticsList");
		mv.addObject("statistics", statisticsList);
		return mv;
	}
	
	@RequestMapping("/Statistics/StatisticsAgeBarList")
	public String statisticsAgeBarList() {
		return "statistics/statisticsAgeBarList";
	}
	
	@RequestMapping("/Statistics/StatisticsAgeStackList")
	public String statisticsAgeStackList() {
		return "statistics/statisticsAgeStackList";
	}
	

	@RequestMapping("/Statistics/StatisticsTrainerList")
	public String statisticsTrainerList() {
		return "statistics/statisticsTrainerList";
	}
	
	@RequestMapping("/Statistics/StatisticsTrainer2List")
	public String statisticsTrainer2List() {
		return "statistics/statisticsTrainer2List";
	}
	
	@RequestMapping("/Statistics/StatisticsGenList")
	public String statisticsList5() {
		return "statistics/statisticsGenList";
	}
	

}
