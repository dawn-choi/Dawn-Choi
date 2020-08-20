package com.pknu.statistics.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pknu.statistics.dao.StatisticsDao;
import com.pknu.statistics.vo.StatisticsVo;

@Repository("statisticsDao")
public class StatisticsDaoImpl implements StatisticsDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<StatisticsVo> getStatisticsList(HashMap<String, Object> map) {
		sqlSession.selectList("Statistics.StatisticsList", map);
		List<StatisticsVo> statisticsList = (List<StatisticsVo>) map.get("result");
		return statisticsList;
	}

	@Override
	public List<StatisticsVo> getAgeList(HashMap<String, Object> map) {
		System.out.println("dao map:" + map);
		sqlSession.selectList("Statistics.AgeList", map);
		List<StatisticsVo> ageList = (List<StatisticsVo>) map.get("result");
		return ageList;
	}

	@Override
	public List<StatisticsVo> getGenList(HashMap<String, Object> map) {
		System.out.println("dao map:" + map);
		sqlSession.selectList("Statistics.GenList", map);
		List<StatisticsVo> ageList = (List<StatisticsVo>) map.get("result");
		return ageList;
	}

	@Override
	public List<StatisticsVo> getTrnList(HashMap<String, Object> map) {
		System.out.println("dao map:" + map);
		sqlSession.selectList("Statistics.TrnList", map);
		List<StatisticsVo> genList = (List<StatisticsVo>) map.get("result");
		return genList;
	}

}
