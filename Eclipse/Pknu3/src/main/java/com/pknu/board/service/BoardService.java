package com.pknu.board.service;

import java.util.HashMap;
import java.util.List;

import com.pknu.board.vo.BoardVo;

public interface BoardService {

	List<BoardVo> getList();

	List<BoardVo> getList2(HashMap<String, Object> map);

	List<BoardVo> getList3(HashMap<String, Object> map);

}
