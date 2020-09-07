package com.pknu.trainers.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pknu.trainers.dao.TrainersDao;
import com.pknu.trainers.vo.TrainersVo;

@Repository("trainersDao")
public class TrainersDaoImpl implements TrainersDao {

	@Autowired
	private SqlSession sqlSession;
	
	/*
	@Override
	public List<TrainersVo> getTrainersList(HashMap<String, Object> map) {
		sqlSession.selectList("Trainers.TrainersInfo", map);
		List<TrainersVo> trainerList = (List<TrainersVo>) map.get("result");
		System.out.println("dao" + trainerList);
		return trainerList;
	}
	*/
	@Override
	public List<TrainersVo> getTrainersInfo(HashMap<String, Object> map) {
		sqlSession.selectList("Trainers.TrainersInfo", map);
		List<TrainersVo> trainerInfo = (List<TrainersVo>) map.get("result");
		System.out.println("dao" + trainerInfo);
		return trainerInfo;
	}



}
