package com.pknu.users.service;

import java.util.HashMap;
import java.util.List;

import com.pknu.users.vo.UsersVo;

public interface UsersService {

	UsersVo login(HashMap<String, Object> map);

	UsersVo findId(HashMap<String, Object> map);

	UsersVo findPwd(HashMap<String, Object> map);

	List<UsersVo> getTicket(HashMap<String, Object> map);

	UsersVo getCount(HashMap<String, Object> map);

	void setMember(HashMap<String, Object> map);

	List<UsersVo>getInfo(HashMap<String, Object> map);

	void deleteMember(HashMap<String, Object> map);

}
