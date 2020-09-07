package com.pknu.board.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pknu.board.dao.BoardDao;
import com.pknu.board.vo.BoardVo;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<BoardVo> getList() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		sqlSession.selectList("SpBoard.BoardList", map);
		List<BoardVo> spBoardList = (List<BoardVo>) map.get("result");
		return spBoardList;
	}

	@Override
	public List<BoardVo> getList2(HashMap<String, Object> map) {
		System.out.println("selone = " + map.get("selone"));
		System.out.println("seltwo = " + map.get("seltwo"));
		

		sqlSession.selectList("SpBoard.BoardSelect", map);
		List<BoardVo> spBoardList = (List<BoardVo>) map.get("result");
		return spBoardList;
	}

	@Override
	public List<BoardVo> getList3(HashMap<String, Object> map) {
		System.out.println("menuname = " + map.get("menuname"));
		

		sqlSession.selectList("SpBoard.BoardMenu", map);
		List<BoardVo> spBoardList = (List<BoardVo>) map.get("result");
		return spBoardList;
	}

}
