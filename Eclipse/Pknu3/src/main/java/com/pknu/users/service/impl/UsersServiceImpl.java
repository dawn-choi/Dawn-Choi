package com.pknu.users.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.pknu.users.dao.UsersDao;
import com.pknu.users.service.UsersService;
import com.pknu.users.vo.UsersVo;

@Service("usersService")
public class UsersServiceImpl implements UsersService {

	@Autowired
	private UsersDao usersDao;
	
	@Override
	public UsersVo login(HashMap<String, Object> map) {
		
		UsersVo usersVo = usersDao.login(map);
		
		return usersVo;
	}

	@Override
	public UsersVo findId(HashMap<String, Object> map) {
			UsersVo usersVo = usersDao.findId(map);
		return usersVo;
	}

	@Override
	public UsersVo findPwd(HashMap<String, Object> map) {
		UsersVo usersVo = usersDao.findPwd(map);
		return usersVo;
	}

	@Override
	public List<UsersVo> getTicket(HashMap<String, Object> map) {
		
		List<UsersVo> ticketList = usersDao.getTicket(map);
		return ticketList;
	}

	@Override
	public UsersVo getCount(HashMap<String, Object> map) {
		UsersVo usersVo = usersDao.getCount(map);
		return usersVo;
	}

	@Override
	public void setMember(HashMap<String, Object> map) {
		usersDao.setMember(map);
		
	}

}
