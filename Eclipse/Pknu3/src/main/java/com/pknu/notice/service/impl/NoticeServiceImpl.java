package com.pknu.notice.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pknu.notice.dao.NoticeDao;
import com.pknu.notice.service.NoticeService;
import com.pknu.notice.vo.FilterVo;
import com.pknu.notice.vo.NoticeVo;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDao noticeDao;
	

	@Override
	public List<NoticeVo> getList(HashMap<String, Object> map) {
		List<NoticeVo> list = noticeDao.getList(map);	
		return list;
	}

	@Override
	public List<FilterVo> getFilterList() {
		List<FilterVo> list = noticeDao.getFilterList();	
		
		return list;
	}

}
