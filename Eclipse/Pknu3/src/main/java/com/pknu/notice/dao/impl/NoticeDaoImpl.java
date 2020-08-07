package com.pknu.notice.dao.impl;

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
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<FilterVo> getFilterList() {
		
		return null;
	}

	
	
}
