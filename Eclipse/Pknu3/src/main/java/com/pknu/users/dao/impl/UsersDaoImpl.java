package com.pknu.users.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pknu.users.dao.UsersDao;
import com.pknu.users.vo.UsersVo;

@Repository("usersDao")
public class UsersDaoImpl implements UsersDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public UsersVo login(HashMap<String, Object> map) {
		UsersVo usersVo = sqlSession.selectOne("User.Login",map);
		return usersVo;
	}

	@Override
	public UsersVo findId(HashMap<String, Object> map) {
		UsersVo usersVo = sqlSession.selectOne("User.Find",map);
		return usersVo;
	}

	@Override
	public UsersVo findPwd(HashMap<String, Object> map) {
		UsersVo usersVo = sqlSession.selectOne("User.Find2",map);
		return usersVo;
	}

	@Override
	public List<UsersVo> getTicket(HashMap<String, Object> map) {
		
		sqlSession.selectList("User.TicketList",map);
		List<UsersVo> ticketList = (List<UsersVo>)map.get("result");
		return ticketList;
	}

	@Override
	public UsersVo getCount(HashMap<String, Object> map) {
		UsersVo usersVo = sqlSession.selectOne("User.Count",map);
		
		return usersVo ;
	}

	@Override
	public void setMember(HashMap<String, Object> map) {
		sqlSession.insert("User.Insert", map);
	}

	@Override
	public List<UsersVo> getInfo(HashMap<String, Object> map) {
		
		sqlSession.selectOne("User.Info", map);
		List<UsersVo> usersVo =  (List<UsersVo>) map.get("result");
		return usersVo;
	}

	@Override
	public void deleteMember(HashMap<String, Object> map) {
		sqlSession.delete("User.Delete", map);
		
	}
}
