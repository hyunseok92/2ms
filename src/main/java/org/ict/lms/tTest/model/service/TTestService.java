package org.ict.lms.tTest.model.service;

import java.util.ArrayList;

import org.ict.lms.common.Search;
import org.ict.lms.tTest.model.vo.TTest;

public interface TTestService {

	public ArrayList<TTest> selectTTest(TTest ttest);

	public int insertTTest(TTest ttest);

	public int deleteTTest(TTest ttest);

	public int updateTTest(TTest ttest);

	public ArrayList<TTest> selectClassMethod(String teacherCode);
	
	public ArrayList<TTest> selectClassMethod1();

	public ArrayList<TTest> selectsubClass(String classCode);

	public ArrayList<TTest> selectAbility(String subjectCode);

	public String selectLastTTest();

	public TTest selectTestCode(String testCode);

	public int updateTestCount(TTest ttest);

	public ArrayList<TTest> selectOpenTest(String subjectCode);

	public ArrayList<TTest> selectTtestView(Search search);

	public int selectTtestViewCount(String classCode);

	public ArrayList<TTest> testResultClassList(Search search);

}
