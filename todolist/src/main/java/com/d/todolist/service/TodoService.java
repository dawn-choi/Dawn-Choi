package com.d.todolist.service;

import java.util.HashMap;
import java.util.List;

import com.d.todolist.vo.Vo;

public interface TodoService {
	List<Vo> getList();

	int move(HashMap<String, Object> map);

	void insert(HashMap<String, Object> map);

    int delete(HashMap<String, Object> map);

}
