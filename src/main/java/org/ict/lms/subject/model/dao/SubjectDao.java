package org.ict.lms.subject.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.ict.lms.subject.model.vo.Subject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("subjectDao")
public class SubjectDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public ArrayList<Subject> selectSubjectList() {
		List<Subject> list = sqlSessionTemplate.selectList("subjectMapper.selectSubjectList");
		return (ArrayList<Subject>)list;
	}
	
	public ArrayList<Subject> selectFirstCateList() {
		List<Subject> list = sqlSessionTemplate.selectList("subjectMapper.selectFirstCateList");
		return (ArrayList<Subject>)list;
	}
	
	public ArrayList<Subject> selectSecondCateList(String keyword) {
		List<Subject> list = sqlSessionTemplate.selectList("subjectMapper.selectSecondCateList", keyword);
		return (ArrayList<Subject>)list;
	}
	
	public ArrayList<Subject> selectThirdCateList(String keyword) {
		List<Subject> list = sqlSessionTemplate.selectList("subjectMapper.selectThirdCateList", keyword);
		return (ArrayList<Subject>)list;
	}
	
	public ArrayList<Subject> selectFourthCateList(String keyword) {
		List<Subject> list = sqlSessionTemplate.selectList("subjectMapper.selectFourthCateList", keyword);
		return (ArrayList<Subject>)list;
	}
	
	public ArrayList<Subject> selectSubjCateList(String keyword) {
		List<Subject> list = sqlSessionTemplate.selectList("subjectMapper.selectSubjCateList", keyword);
		return (ArrayList<Subject>)list;
	}

}
