package com.pknu.statistics.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pknu.schedule.vo.ScheduleVo;
import com.pknu.statistics.dao.StatisticsDao;
import com.pknu.statistics.service.StatisticsService;
import com.pknu.statistics.vo.StatisticsVo;

@Service("StatisticsService")
public class StatisticsServiceImpl implements StatisticsService {
	
	@Autowired()
	private StatisticsDao statisticsDao;

	@Override
	public List<StatisticsVo> getAgeList(HashMap<String, Object> map) {
		List<StatisticsVo> ageList = statisticsDao.getAgeList(map);
		return ageList;
	}

	@Override
	public List<StatisticsVo> getGenList(HashMap<String, Object> map) {
		List<StatisticsVo> genList = statisticsDao.getGenList(map);
		return genList;
	}

	@Override
	public List<StatisticsVo> getTrnList(HashMap<String, Object> map) {
		List<StatisticsVo> trnList = statisticsDao.getTrnList(map);
		return trnList;
	}

}
