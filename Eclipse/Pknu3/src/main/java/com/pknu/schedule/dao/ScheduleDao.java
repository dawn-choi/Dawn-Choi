package com.pknu.schedule.dao;

import java.util.HashMap;
import java.util.List;

import com.pknu.schedule.vo.ScheduleVo;

public interface ScheduleDao {

	List<ScheduleVo> getScheduleList(HashMap<String, Object> map);

	List<ScheduleVo> getScheduleView(HashMap<String, Object> map);

	List<ScheduleVo> getImpList(HashMap<String, Object> map);

}
