package com.pknu.subject.dao;

import java.util.HashMap;
import java.util.List;

import com.pknu.subject.vo.SubjectVo;

public interface SubjectDao {

	List<SubjectVo> getTotList(HashMap<String, Object> map);

	List<SubjectVo> getGrList(HashMap<String, Object> map);

}
