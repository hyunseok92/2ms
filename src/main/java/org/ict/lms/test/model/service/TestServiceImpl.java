package org.ict.lms.test.model.service;

import java.util.ArrayList;

import org.ict.lms.test.model.dao.TestDao;
import org.ict.lms.test.model.vo.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("testService")
public class TestServiceImpl implements TestService{
	
	@Autowired
	private TestDao td;
	
	

	@Override
	public int insertProbMehod(Test test) {
		return td.insertProbMehod(test);
	}



	@Override
	public Test selectLastProb(String testCode) {
		return td.selectLastProb(testCode);
	}



	@Override
	public ArrayList<Test> selectMprodbMethod(String testCode) {
		return td.selectMprodbMethod(testCode);
	}



	@Override
	public int deleteMprop(Test test) {
		return td.deleteMprop(test);
	}



	@Override
	public int updateMprop(Test test) {
		return td.updateMprop(test);
	}



	@Override
	public int updateDTestNo(Test test2) {
		return td.updateDTestNo(test2);
	}



	@Override
	public int deleteProps(String testCode) {
		return td.deleteProps(testCode);
	}

	

}
