package com.pknu.statistics.service;

import java.util.HashMap;
import java.util.List;

import com.pknu.statistics.vo.StatisticsVo;

public interface StatisticsService {

	List<StatisticsVo> getAgeList(HashMap<String, Object> map);

	List<StatisticsVo> getGenList(HashMap<String, Object> map);

	List<StatisticsVo> getTrnList(HashMap<String, Object> map);

}
