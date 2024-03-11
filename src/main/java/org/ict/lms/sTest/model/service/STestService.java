package org.ict.lms.sTest.model.service;

import java.util.ArrayList;

import org.ict.lms.common.Search;
import org.ict.lms.sTest.model.vo.STest;

public interface STestService {

	public STest selectTestScore(STest stest);

	public ArrayList<STest> selectTestScoreList(String testCode);

	public int insertTestScore(STest stest);

	public String selectStestView(String studentCode);

	public ArrayList<STest> selectSTProdList(String testCode);

	public int insertSTestMprop(STest stest);

	public int updateSTestMpropSumScore(STest finalStest);

	public ArrayList<STest> selectStestTestCode(String studentCode);

	public ArrayList<STest> selectStestResult(STest stest);

	public ArrayList<STest> selectTestClearStudent(String testCode);

	public ArrayList<STest> selectMarkTestMethod(STest stest);

	public int updateMarkTestResult(STest stest);

	public int deleteSTestMethod(String testCode);

}
