package com.pknu.trainers.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pknu.trainers.dao.TrainersDao;
import com.pknu.trainers.service.TrainersService;
import com.pknu.trainers.vo.TrainersVo;

@Service("trainersService")
public class TrainersServiceImpl implements TrainersService{

	@Autowired
	private TrainersDao trainersDao;
	
	/*
	@Override
	public List<TrainersVo> getTrainersList(HashMap<String, Object> map) {
		List<TrainersVo> trainersList = trainersDao.getTrainersList(map);
		System.out.println("service" + trainersList);
		return trainersList;
	}
	*/
	
	@Override
	public List<TrainersVo> getTrainersInfo(HashMap<String, Object> map) {
		List<TrainersVo> trainersInfo = trainersDao.getTrainersInfo(map);
		System.out.println("service" + trainersInfo);
		return trainersInfo;
	}



}
