package com.pknu.statistics.service;

import java.util.HashMap;
import java.util.List;

import com.pknu.statistics.vo.StatisticsVo;

public interface StatisticsService {

	List<StatisticsVo> getStatisticsList(HashMap<String, Object> map);

}
