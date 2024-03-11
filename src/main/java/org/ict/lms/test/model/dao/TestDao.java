package org.ict.lms.test.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.ict.lms.test.model.vo.Test;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("td")
public class TestDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public Test selectTest(Test test) {
		// TODO Auto-generated method stub
		return null;
	}

	public int insertTest(Test test) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteTest(String testCode) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int updateTest(Test test) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int insertProbMehod(Test test) {
		return sqlSessionTemplate.insert("testMapper.insertProbMehod", test);
	}

	public Test selectLastProb(String testCode) {
		return sqlSessionTemplate.selectOne("testMapper.selectLastProb", testCode);
	}

	public ArrayList<Test> selectMprodbMethod(String testCode) {
		List<Test> list = sqlSessionTemplate.selectList("testMapper.selectMprodbMethod", testCode);
		return (ArrayList<Test>)list;
	}

	public int deleteMprop(Test test) {
		return sqlSessionTemplate.delete("testMapper.deleteMprop", test);
	}

	public int updateMprop(Test test) {
		return sqlSessionTemplate.update("testMapper.updateMprop", test);
	}

	public int updateDTestNo(Test test2) {
		return sqlSessionTemplate.update("testMapper.updateDTestNo", test2);
	}

	public int deleteProps(String testCode) {
		return sqlSessionTemplate.delete("testMapper.deleteProps", testCode);
	}

}
