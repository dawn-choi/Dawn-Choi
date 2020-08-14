package com.pknu.board.dao;

import java.util.HashMap;
import java.util.List;

import com.pknu.board.vo.BoardVo;

public interface BoardDao {

	List<BoardVo> getList();

	List<BoardVo> getList2(HashMap<String, Object> map); 

}
