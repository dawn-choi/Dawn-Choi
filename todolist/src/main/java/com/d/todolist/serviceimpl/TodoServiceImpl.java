package com.d.todolist.serviceimpl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.d.todolist.dao.TodoDao;
import com.d.todolist.service.TodoService;
import com.d.todolist.vo.Vo;

@Service
public class TodoServiceImpl implements TodoService{

	@Autowired
	private TodoDao todoDao;

	@Override
	public List<Vo> getList() {
		List<Vo> TodoList = todoDao.getList();
		return TodoList;
	}

	@Override
	public int move(HashMap<String, Object> map) {
		return todoDao.move(map);
	}

	@Override
	public void insert(HashMap<String, Object> map) {
		todoDao.insert(map);
	}

    @Override
    public int delete(HashMap<String, Object> map) {
        return todoDao.delete(map);
    }
	


}
