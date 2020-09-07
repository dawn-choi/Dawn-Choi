package com.pknu.trainers.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pknu.trainers.service.TrainersService;
import com.pknu.trainers.vo.TrainersVo;

@Controller
public class TrainersController {
	
	@Autowired
	private TrainersService trainersService;
	
	/*
	@RequestMapping("Trainers/TrainersList")
	public ModelAndView trainersList(TrainersVo vo) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		List<TrainersVo> trainersList = trainersService.getTrainersList(map);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("trainers/trainersList");
		mv.addObject("trainersList", trainersList);
		return mv;
		
	}
	*/
	@RequestMapping("Trainers/TrainersInfo")
	public ModelAndView trainersInfo(TrainersVo vo) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		List<TrainersVo> trainersInfo = trainersService.getTrainersInfo(map);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("trainers/trainersInfo");
		mv.addObject("trainersInfo", trainersInfo);
		return mv;
	}
	
	@RequestMapping("/Trainers/Write")
	public String TrainersWrite() {
		return "trainers/trainersWrite";
	}
	
	/*
	@RequestMapping("/Trainers/TrainersOk")
	public String trainersOk(TrainersVo vo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("tname",    vo.getTname());
		map.put("tgender",  vo.getTgender());
		map.put("tage",     vo.getTbirth());
		map.put("tcareer",  vo.getTcareer());
		map.put("tlicense", vo.getTlicense());
		map.put("lname",    vo.getLname());
		
		trainersService.setTrainerWrite(map);
		return "redirect:/Trainers/TrainersList";
	}*/
	
	
}	
