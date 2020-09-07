package com.pknu.trainers.service;

import java.util.HashMap;
import java.util.List;

import com.pknu.trainers.vo.TrainersVo;

public interface TrainersService {

	//List<TrainersVo> getTrainersList(HashMap<String, Object> map);
	
	List<TrainersVo> getTrainersInfo(HashMap<String, Object> map);


}
