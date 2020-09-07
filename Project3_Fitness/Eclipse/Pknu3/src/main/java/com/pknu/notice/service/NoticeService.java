package com.pknu.notice.service;




import java.util.HashMap;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.pknu.notice.vo.ContentVo;
import com.pknu.notice.vo.FilesVo;
import com.pknu.notice.vo.FilterVo;
import com.pknu.notice.vo.LikeVo;
import com.pknu.notice.vo.NoticeVo;


public interface NoticeService {

	List<NoticeVo> getList(HashMap<String, Object> map);

	List<FilterVo> getFilterList();

	void setWrite(HashMap<String, Object> map, HttpServletRequest request);

	void plusRC(HashMap<String, Object> map);

	List<ContentVo> getContent(HashMap<String, Object> map);

	List<LikeVo> settingLike(HashMap<String, Object> map);

	int showLike(String idx);

	void switchLike(HashMap<String, Object> map);

	void switchUnLike(HashMap<String, Object> map);

	List<FilesVo> getFileList(HashMap<String, Object> map);

	String showBtns(String idx);

	void fileDelete(String filenum);

	void updateWrite(HashMap<String, Object> map, HttpServletRequest request);

	void noticeDelete(HashMap<String, Object> map);

	List<NoticeVo> getSearchList(HashMap<String, Object> map);


	
	


}
