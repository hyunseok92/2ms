package org.ict.lms.sTest.model.service;

import java.util.ArrayList;

import org.ict.lms.common.Search;
import org.ict.lms.sTest.model.dao.STestDao;
import org.ict.lms.sTest.model.vo.STest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("sts")
public class STestServiceImpl implements STestService{
	
	@Autowired
	private STestDao std;
	
	public STestServiceImpl() {}
	
	public STest selectTestScore(STest stest) {
		return std.selectTestScore(stest);
	}

	public ArrayList<STest> selectTestScoreList(String testCode){
		return std.selectTestScoreList(testCode);
	}

	public int insertTestScore(STest stest) {
		return std.insertTestScore(stest);
	}

	@Override
	public String selectStestView(String studentCode) {
		return std.selectStestView(studentCode);
		
	}

	@Override
	public ArrayList<STest> selectSTProdList(String testCode) {
		return std.selectSTProdList(testCode);
	}

	@Override
	public int insertSTestMprop(STest stest) {
		return std.insertSTestMprop(stest);
	}

	@Override
	public int updateSTestMpropSumScore(STest finalStest) {
		return std.updateSTestMpropSumScore(finalStest);
	}

	@Override
	public ArrayList<STest> selectStestTestCode(String studentCode) {
		return std.selectStestTestCode(studentCode);
	}

	@Override
	public ArrayList<STest> selectStestResult(STest stest) {
		return std.selectStestResult(stest);
	}

	@Override
	public ArrayList<STest> selectTestClearStudent(String testCode) {
		return std.selectTestClearStudent(testCode);
	}

	@Override
	public ArrayList<STest> selectMarkTestMethod(STest stest) {
		return std.selectMarkTestMethod(stest);
	}

	@Override
	public int updateMarkTestResult(STest stest) {
		return std.updateMarkTestResult(stest);
	}

	@Override
	public int deleteSTestMethod(String testCode) {
		return std.deleteSTestMethod(testCode);
	}
	
}
