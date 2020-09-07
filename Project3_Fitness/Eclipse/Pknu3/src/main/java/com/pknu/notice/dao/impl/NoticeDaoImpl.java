package com.pknu.notice.dao.impl;

import com.pknu.notice.dao.NoticeDao;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pknu.notice.dao.NoticeDao;
import com.pknu.notice.vo.ContentVo;
import com.pknu.notice.vo.FilesVo;
import com.pknu.notice.vo.FilterVo;
import com.pknu.notice.vo.LikeVo;
import com.pknu.notice.vo.NoticeVo;


@Repository("noticeDao")
public class NoticeDaoImpl implements NoticeDao {

	@Autowired
	private SqlSession sqlSession;
	


	@Override
	public List<NoticeVo> getList(HashMap<String, Object> map) {

		sqlSession.selectList("Notice.NoticeList", map);
		
		List<NoticeVo> list = (List<NoticeVo>) map.get("result");
		
		System.out.println(list);
		
		return  list;
	}


	@Override
	public List<FilterVo> getFilterList() {
		
		HashMap map = new HashMap();
		
		sqlSession.selectList("Notice.FilterList", map);
		
		List<FilterVo> list = (List<FilterVo>) map.get("result");
		
		return list;
	}


	@Override
	public void setWrite(HashMap<String, Object> map) {
		
		sqlSession.insert("Notice.InsertList", map);
		
	}


	@Override
	public void plusRC(HashMap<String, Object> map) {
		sqlSession.update("Notice.PlusRC", map);
		
	}


	@Override
	public List<ContentVo> getContent(HashMap<String, Object> map) {
		
		sqlSession.selectList("Notice.NoticeContent", map);
		
		List<ContentVo> list = (List<ContentVo>) map.get("result");
		
		System.out.println(list);
		
		return  list;
	}


	@Override
	public List<LikeVo> settingLike(HashMap<String, Object> map) {
		
		sqlSession.selectList("Notice.NoticeLike", map);
		
		List<LikeVo> list = (List<LikeVo>) map.get("result");
		
		System.out.println(list);
		
		return list;
	}


	@Override
	public int showLike(String idx) {
		int ridx = Integer.valueOf(idx);
				
		int showLike = sqlSession.selectOne("Notice.NoticeShowLike", ridx);
		
		
		return showLike;
	}


	@Override
	public void switchLike(HashMap<String, Object> map) {
		
		sqlSession.insert("Notice.NoticeSwitchLike", map);
		
		sqlSession.update("Notice.LikeCountPlus", map);
		
	}


	@Override
	public void switchUnLike(HashMap<String, Object> map) {
		
		sqlSession.delete("Notice.NoticeSwitchUnLike", map);
		
		sqlSession.update("Notice.LikeCountMinus", map);
		
	}


	@Override
	public List<FilesVo> getFileList(HashMap<String, Object> map) {
		
		sqlSession.selectList("Notice.FileList", map);
		List<FilesVo> fileList = (List<FilesVo>) map.get("result");

		return fileList;
	}


	@Override
	public String showBtns(String idx) {
		int ridx = Integer.valueOf(idx);
		String mid = sqlSession.selectOne("Notice.selectMid", ridx);
		return mid;
	}


	@Override
	public void fileDelete(String filenum) {
		
		int sfilenum = Integer.valueOf(filenum);
		
		sqlSession.delete("Notice.fileDelete", sfilenum);
		
	}


	@Override
	public void updateWrite(HashMap<String, Object> map) {
		
		System.out.println("수정 놈들 :" + map);
		sqlSession.update("Notice.UpdateWrite", map);
		
	}


	@Override
	public void noticeDelete(HashMap<String, Object> map) {
		sqlSession.delete("Notice.NoticeDelete", map);
		
	}


	@Override
	public List<NoticeVo> getSearchList(HashMap<String, Object> map) {
		sqlSession.selectList("Notice.NoticeSearchList", map);
		
		List<NoticeVo> list = (List<NoticeVo>) map.get("result");
		
		System.out.println(list);
		
		return  list;
	}


	

	
	
}
