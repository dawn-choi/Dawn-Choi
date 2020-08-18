package com.pknu.statistics.dao;

import java.util.HashMap;
import java.util.List;

import com.pknu.statistics.vo.StatisticsVo;

public interface StatisticsDao {

	List<StatisticsVo> getStatisticsList(HashMap<String, Object> map);

}
