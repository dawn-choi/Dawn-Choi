package com.pknu.subject.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pknu.subject.dao.SubjectDao;
import com.pknu.subject.vo.SubjectVo;

@Repository("subjectDao")
public class SubjectDaoImpl implements SubjectDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<SubjectVo> getTotList(HashMap<String, Object> map) {
		
		sqlSession.selectList("Subject.SubjectList", map);
		
		List<SubjectVo> subjectList = (List<SubjectVo>) map.get("result");
		
		return subjectList;
	}

	@Override
	public List<SubjectVo> getGrList(HashMap<String, Object> map) {
		
		sqlSession.selectList("Subject.grList", map);
		
		List<SubjectVo> groupList = (List<SubjectVo>) map.get("result");
		
		return groupList;
	}

}
