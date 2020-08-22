package com.pknu.notice.service;




import java.util.HashMap;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.pknu.notice.vo.FilterVo;
import com.pknu.notice.vo.NoticeVo;


public interface NoticeService {

	List<NoticeVo> getList(HashMap<String, Object> map);

	List<FilterVo> getFilterList();

	void setWrite(HashMap<String, Object> map, HttpServletRequest request);


	
	


}
