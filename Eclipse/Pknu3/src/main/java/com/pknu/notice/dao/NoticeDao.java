package com.pknu.notice.dao;


import java.util.HashMap;
import java.util.List;

import com.pknu.notice.vo.FilterVo;
import com.pknu.notice.vo.NoticeVo;


public interface NoticeDao {

	List<NoticeVo> getList(HashMap<String, Object> map);

	List<FilterVo> getFilterList();

	void setWrite(HashMap<String, Object> map);



}
