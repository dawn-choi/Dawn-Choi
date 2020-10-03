package com.d.todolist.daoimpl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.d.todolist.dao.TodoDao;
import com.d.todolist.vo.Vo;

@Repository
public class TodoDaoImpl implements TodoDao{

	@Autowired
	private SqlSession sqlSession;
		
	@Override
	public List<Vo> getList() {
		
		List<Vo> getList = sqlSession.selectList("Todo.TodoList");
		return getList;
	}

	@Override
	public int move(HashMap<String, Object> map) {
		int result = sqlSession.update("Todo.Update",map);
		
		return result;
	}

	@Override
	public void insert(HashMap<String, Object> map) {
	  sqlSession.insert("Todo.Insert",map);
	}

    @Override
    public int delete(HashMap<String, Object> map) {
      int result =  sqlSession.delete("Todo.Delete",map);
        return result;
    }

    @Override
    public void update(HashMap<String, Object> map) {
        System.out.println(map);
       sqlSession.update("Todo.Update2",map);
    }

}
