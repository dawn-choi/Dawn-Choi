package com.pknu.subject.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pknu.subject.dao.SubjectDao;
import com.pknu.subject.service.SubjectSerivce;
import com.pknu.subject.vo.SubjectVo;

@Service("subjectService")
public class SubjectServiceImpl implements SubjectSerivce{

	@Autowired
	private SubjectDao subjectdao;
	
	@Override
	public List<SubjectVo> getTotList(HashMap<String, Object> map) {
		
		List<SubjectVo> subjectList = subjectdao.getTotList(map);
		
		return subjectList;
	}

	@Override
	public List<SubjectVo> getGrList(HashMap<String, Object> map) {
		
		List<SubjectVo> groupList = subjectdao.getGrList(map);
		
		return groupList;
	}

	@Override
	public List<SubjectVo> getSubjectByFilter(HashMap<String, Object> map) {
		
		List<SubjectVo> subjectList = subjectdao.getSubjectByFilter(map);
		
		return subjectList;
	}

	@Override
	public List<SubjectVo> getSubjectBySearch(HashMap<String, Object> map) {
		
		List<SubjectVo> subjectList = subjectdao.getSubjectBySearch(map);
		
		return subjectList;
	}

	@Override
	public void setRegister(HashMap<String, Object> map) {
		
		 subjectdao.setRegister(map);
		
		
	}

}
