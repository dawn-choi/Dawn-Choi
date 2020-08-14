package com.pknu.schedule.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pknu.schedule.dao.ScheduleDao;
import com.pknu.schedule.service.ScheduleService;
import com.pknu.schedule.vo.ScheduleVo;

@Service("ScheduleService")
public class ScheduleServiceImpl implements ScheduleService {

	@Autowired
	private ScheduleDao scheduleDao;

	@Override
	public List<ScheduleVo> getScheduleList(HashMap<String, Object> map) {
		//System.out.println("service : " +map);
		List<ScheduleVo> scheduleList = scheduleDao.getScheduleList(map);
		//System.out.println(map);
		return scheduleList;

	}

	@Override
	public List<ScheduleVo> getScheduleView(HashMap<String, Object> map) {
		//System.out.println("service" + map);
		List<ScheduleVo> scheduleView = scheduleDao.getScheduleView(map);
		return scheduleView;
	}


	@Override
	public List<ScheduleVo> getImpList(HashMap<String, Object> map) {
		System.out.println("service" + map);
		List<ScheduleVo> impList = scheduleDao.getImpList(map);
		return impList;
	}
	
	

}
