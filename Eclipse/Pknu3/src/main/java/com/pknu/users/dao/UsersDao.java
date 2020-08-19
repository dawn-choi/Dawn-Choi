package com.pknu.users.dao;

import java.util.HashMap;
import java.util.List;

import com.pknu.users.vo.UsersVo;

public interface UsersDao {

	public UsersVo login(HashMap<String, Object> map);

	public UsersVo findId(HashMap<String, Object> map);

	public UsersVo findPwd(HashMap<String, Object> map);

	public List<UsersVo> getTicket(HashMap<String, Object> map);

	public UsersVo getCount(HashMap<String, Object> map);

	public void setMember(HashMap<String, Object> map); 

}
