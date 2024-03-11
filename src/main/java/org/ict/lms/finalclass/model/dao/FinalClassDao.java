package org.ict.lms.finalclass.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.ict.lms.course.model.vo.Course;
import org.ict.lms.finalclass.model.vo.FinalClass;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("finalClassDao")
public class FinalClassDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public ArrayList<FinalClass> selectFinalClassList(){
		List<FinalClass> list = sqlSessionTemplate.selectList("finalClassMapper.selectFinalClassList");
		return (ArrayList<FinalClass>)list;
	}
	
	public FinalClass selectFinalClassDetail(String classCode) {
		return sqlSessionTemplate.selectOne("finalClassMapper.selectFinalClassDetail", classCode);
	}
	
	public int insertFinalClass(Course course) {
		return sqlSessionTemplate.update("finalClassMapper.insertFinalClass", course);
	}
}
