package org.ict.lms.sTest.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.ict.lms.sTest.model.vo.STest;
import org.ict.lms.tTest.model.vo.TTest;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("std")
public class STestDao {
	@Autowired //root-context.xml 에서 생성한 객체를 자동 연결함
	private SqlSessionTemplate sqlSessionTemplate;

	public STest selectTestScore(STest stest) {
		// TODO Auto-generated method stub
		return null;
	}

	public ArrayList<STest> selectTestScoreList(String testCode) {
		// TODO Auto-generated method stub
		return null;
	}

	public int insertTestScore(STest stest) {
		// TODO Auto-generated method stub
		return 0;
	}

	public String selectStestView(String studentCode) {
		return sqlSessionTemplate.selectOne("stestMapper.selectStestView", studentCode);
		 
	}

	public ArrayList<STest> selectSTProdList(String testCode) {
		List<STest> list = sqlSessionTemplate.selectList("stestMapper.selectSTProdList", testCode);
		return (ArrayList<STest>)list;
	}

	public int insertSTestMprop(STest stest) {
		return sqlSessionTemplate.insert("stestMapper.insertSTestMprop", stest);
	}

	public int updateSTestMpropSumScore(STest finalStest) {
		return sqlSessionTemplate.insert("stestMapper.updateSTestMpropSumScore", finalStest);
	}

	public ArrayList<STest> selectStestTestCode(String studentCode) {
		List<STest> list = sqlSessionTemplate.selectList("stestMapper.selectStestTestCode", studentCode);
		return (ArrayList<STest>)list;
	}

	public ArrayList<STest> selectStestResult(STest stest) {
		List<STest> list = sqlSessionTemplate.selectList("stestMapper.selectStestResult", stest);
		return (ArrayList<STest>)list;
	}

	public ArrayList<STest> selectTestClearStudent(String testCode) {
		List<STest> list = sqlSessionTemplate.selectList("stestMapper.selectTestClearStudent", testCode);
		return (ArrayList<STest>)list;
	}

	public ArrayList<STest> selectMarkTestMethod(STest stest) {
		List<STest> list = sqlSessionTemplate.selectList("stestMapper.selectMarkTestMethod", stest);
		return (ArrayList<STest>)list;
	}

	public int updateMarkTestResult(STest stest) {
		return sqlSessionTemplate.insert("stestMapper.updateMarkTestResult", stest);
	}

	public int deleteSTestMethod(String testCode) {
		return sqlSessionTemplate.delete("stestMapper.deleteSTestMethod", testCode);
	}
}
