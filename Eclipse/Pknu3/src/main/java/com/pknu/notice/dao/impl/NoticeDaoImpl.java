package com.pknu.notice.dao.impl;

import com.pknu.notice.dao.NoticeDao;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pknu.notice.dao.NoticeDao;
import com.pknu.notice.vo.FilterVo;
import com.pknu.notice.vo.NoticeVo;


@Repository("noticeDao")
public class NoticeDaoImpl implements NoticeDao {

	@Autowired
	private SqlSession sqlSession;
	


	@Override
	public List<NoticeVo> getList(HashMap<String, Object> map) {

		sqlSession.selectList("Notice.NoticeList", map);
		
		List<NoticeVo> list = (List<NoticeVo>) map.get("result");
		
		System.out.println(list);
		
		return  list;
	}


	@Override
	public List<FilterVo> getFilterList() {
		
		HashMap map = new HashMap();
		
		sqlSession.selectList("Notice.FilterList", map);
		
		List<FilterVo> list = (List<FilterVo>) map.get("result");
		
		return list;
	}


	@Override
	public void setWrite(HashMap<String, Object> map) {
		
		sqlSession.insert("Notice.InsertList", map);
		
	}


	

	
	
}
