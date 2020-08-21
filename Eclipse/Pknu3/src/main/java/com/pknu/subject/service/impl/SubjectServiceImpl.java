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
	private SubjectDao subjectDao;
	
	@Override
	public List<SubjectVo> getTotList(HashMap<String, Object> map) {
		
		List<SubjectVo> subjectList = subjectDao.getTotList(map);
		
		return subjectList;
	}

	@Override
	public List<SubjectVo> getGrList(HashMap<String, Object> map) {
		
		List<SubjectVo> groupList = subjectDao.getGrList(map);
		
		return groupList;
	}

	@Override
	public List<SubjectVo> getSubjectByFilter(HashMap<String, Object> map) {
		
		List<SubjectVo> subjectList = subjectDao.getSubjectByFilter(map);
		
		return subjectList;
	}

	@Override
	public List<SubjectVo> getSubjectBySearch(HashMap<String, Object> map) {
		
		List<SubjectVo> subjectList = subjectDao.getSubjectBySearch(map);
		
		return subjectList;
	}

	@Override
	public void setRegister(HashMap<String, Object> map) {
		
		 subjectDao.setRegister(map);		
	
	}

	@Override
	public List<SubjectVo> getGrSelect(HashMap<String, Object> map) {
		
		List<SubjectVo> grList = subjectDao.getGrSelect(map);
		
		return grList;
	}

	@Override
	public List<SubjectVo> getClassSelect(HashMap<String, Object> map) {
		
		List<SubjectVo> classList = subjectDao.getClassSelect(map);
		
		return classList;
	}

	@Override
	public List<SubjectVo> getTermSelect(HashMap<String, Object> map) {

		List<SubjectVo> termList = subjectDao.getTermSelect(map);
		
		return termList;
	}

	@Override
	public List<SubjectVo> getTicketList(HashMap<String, Object> map) {
		
		List<SubjectVo> ticketList = subjectDao.getTicketList(map);
		
		return ticketList;
	}

	@Override
	public void getTicket(HashMap<String, Object> map) {
		
		subjectDao.getTicket(map);
		
	}

}
