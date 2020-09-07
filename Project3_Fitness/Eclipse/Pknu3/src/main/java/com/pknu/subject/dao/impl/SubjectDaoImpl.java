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

	@Override
	public List<SubjectVo> getSubjectByFilter(HashMap<String, Object> map) {
		sqlSession.selectList("Subject.ListByFilter", map);
		
		List<SubjectVo> subjectList = (List<SubjectVo>) map.get("result");
		
		return subjectList;
	}

	@Override
	public List<SubjectVo> getSubjectBySearch(HashMap<String, Object> map) {
		sqlSession.selectList("Subject.ListBySearch", map);
		
		List<SubjectVo> subjectList = (List<SubjectVo>) map.get("result");
		
		return subjectList;
	}

	@Override
	public void setRegister(HashMap<String, Object> map) {
		
		sqlSession.insert("Subject.LectureRegister", map);
		
		System.out.println(map);
		
		
	}

	@Override
	public List<SubjectVo> getGrSelect(HashMap<String, Object> map) {
		sqlSession.selectList("Ticket.GrList", map);
		
		List<SubjectVo> grList = (List<SubjectVo>) map.get("result");
		
		return grList;
	}
	

	@Override
	public List<SubjectVo> getClassSelect(HashMap<String, Object> map) {
		sqlSession.selectList("Ticket.ClassList", map);
		
		List<SubjectVo> classList = (List<SubjectVo>) map.get("result");
		
		return classList;
	}

	@Override
	public List<SubjectVo> getTermSelect(HashMap<String, Object> map) {
		sqlSession.selectList("Ticket.TermList", map);
		
		List<SubjectVo> termList = (List<SubjectVo>) map.get("result");
		
		return termList;
	}

	@Override
	public List<SubjectVo> getTicketList(HashMap<String, Object> map) {
		
		sqlSession.selectList("Ticket.TicketList", map);
		List<SubjectVo> ticketList = (List<SubjectVo>) map.get("result");
		
		return ticketList;
	}
	
	@Override
	public void getTicket(HashMap<String, Object> map) {
		
		sqlSession.insert("Ticket.TicketCharge", map);
		
	}


}
