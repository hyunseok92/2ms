package org.ict.lms.tTest.model.service;

import java.util.ArrayList;

import org.ict.lms.common.Search;
import org.ict.lms.tTest.model.dao.TTestDao;
import org.ict.lms.tTest.model.vo.TTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("tts")
public class TTestServiceImpl implements TTestService{
	
	@Autowired
	private TTestDao ttd;
	
	public TTestServiceImpl() {}

	@Override
	public ArrayList<TTest> selectTTest(TTest ttest) {
		// TODO Auto-generated method stub
		return ttd.selectTTest(ttest);
	}

	@Override
	public int insertTTest(TTest ttest) {
		// TODO Auto-generated method stub
		return ttd.insertTTest(ttest);
	}

	@Override
	public int deleteTTest(TTest ttest) {
		// TODO Auto-generated method stub
		return ttd.deleteTTest(ttest);
	}

	@Override
	public int updateTTest(TTest ttest) {
		// TODO Auto-generated method stub
		return ttd.updateTTest(ttest);
	}

	@Override
	public ArrayList<TTest> selectClassMethod(String teacherCode) {
		return ttd.selectClass(teacherCode);
	}
	
	@Override
	public ArrayList<TTest> selectClassMethod1() {
		return ttd.selectClass1();
	}

	@Override
	public ArrayList<TTest> selectsubClass(String classCode) {
		return ttd.selectsubClass(classCode);
	}

	@Override
	public ArrayList<TTest> selectAbility(String subjectCode) {
		return ttd.selectAbility(subjectCode);
	}

	@Override
	public String selectLastTTest() {
		return ttd.selectLastTTest();
		
	}

	@Override
	public TTest selectTestCode(String testCode) {
		return ttd.selectTestCode(testCode);
	}

	@Override
	public int updateTestCount(TTest ttest) {
		return ttd.updateTestCount(ttest);
	}

	@Override
	public ArrayList<TTest> selectOpenTest(String subjectCode) {
		return ttd.selectOpenTest(subjectCode);
	}

	@Override
	public ArrayList<TTest> selectTtestView(Search search) {
		return ttd.selectTtestView(search);
	}

	@Override
	public int selectTtestViewCount(String classCode) {
		return ttd.selectTtestViewCount(classCode);
	}

	@Override
	public ArrayList<TTest> testResultClassList(Search search) {
		return ttd.testResultClassList(search);
	}
}
