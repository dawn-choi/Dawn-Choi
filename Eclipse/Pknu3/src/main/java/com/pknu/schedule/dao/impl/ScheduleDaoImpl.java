package com.pknu.schedule.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pknu.schedule.dao.ScheduleDao;
import com.pknu.schedule.vo.ScheduleVo;

@Repository("scheduleDao")
public class ScheduleDaoImpl implements ScheduleDao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<ScheduleVo> getScheduleList(HashMap<String, Object> map) {
		sqlSession.selectList("Schedule.ScheduleList", map);
		List<ScheduleVo> scheduleList = (List<ScheduleVo>) map.get("result");
		return scheduleList;
	}

	@Override
	public List<ScheduleVo> getScheduleView(HashMap<String, Object> map) {
		//System.out.println("dao : " +map);
		sqlSession.selectList("Schedule.ScheduleView", map);
		List<ScheduleVo> scheduleView  = (List<ScheduleVo>) map.get("result");
		return scheduleView;
	}

	@Override
	public List<ScheduleVo> getImpList(HashMap<String, Object> map) {
		//System.out.println("dao : " +map);
		sqlSession.selectList("Schedule.ImpList", map);
		List<ScheduleVo> impList = (List<ScheduleVo>) map.get("result");
		return impList;
	}


	
}
