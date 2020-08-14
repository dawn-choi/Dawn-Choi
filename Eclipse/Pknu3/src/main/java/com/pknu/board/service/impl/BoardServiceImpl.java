package com.pknu.board.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pknu.board.dao.BoardDao;
import com.pknu.board.service.BoardService;
import com.pknu.board.vo.BoardVo;

@Service("spBoardService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDao BoardDao;

	@Override
	public List<BoardVo> getList() {
		List<BoardVo> spBoardList = BoardDao.getList();
		return spBoardList;
	}

	@Override
	public List<BoardVo> getList2(HashMap<String, Object> map) {
		List<BoardVo> spBoardList = BoardDao.getList2(map);
		return spBoardList;
	}

}
