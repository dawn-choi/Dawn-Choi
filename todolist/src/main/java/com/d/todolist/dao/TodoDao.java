package com.d.todolist.dao;

import java.util.HashMap;
import java.util.List;

import com.d.todolist.vo.Vo;

public interface TodoDao {

	List<Vo> getList();

	int move(HashMap<String, Object> map);

	void insert(HashMap<String, Object> map);

    int delete(HashMap<String, Object> map);

    void update(HashMap<String, Object> map);

}
