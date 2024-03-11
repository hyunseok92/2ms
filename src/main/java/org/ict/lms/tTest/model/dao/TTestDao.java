package org.ict.lms.tTest.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.ict.lms.common.Search;
import org.ict.lms.tTest.model.vo.TTest;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("ttd")
public class TTestDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public ArrayList<TTest> selectClass(String teacherCode){
		List<TTest> list = sqlSessionTemplate.selectList("ttestMapper.selectClass", teacherCode);
		return (ArrayList<TTest>)list;
	}
	
	public ArrayList<TTest> selectClass1() {
		List<TTest> list = sqlSessionTemplate.selectList("ttestMapper.selectClass1");
		return (ArrayList<TTest>)list;
	}
	
	public ArrayList<TTest> selectTTest(TTest ttest) {
		// TODO Auto-generated method stub
		return null;
	}

	public int insertTTest(TTest ttest) {
		return sqlSessionTemplate.insert("ttestMapper.insertTTest", ttest);
	}

	public int deleteTTest(TTest ttest) {
		return sqlSessionTemplate.delete("ttestMapper.deleteTTest", ttest);
	}

	public int updateTTest(TTest ttest) {
		return sqlSessionTemplate.update("ttestMapper.updateTTest", ttest);
	}
	public ArrayList<TTest> selectsubClass(String classCode) {
		List<TTest> list = sqlSessionTemplate.selectList("ttestMapper.selectsubClass", classCode);
		return (ArrayList<TTest>)list;
	}

	public ArrayList<TTest> selectAbility(String subjectCode) {
		List<TTest> list = sqlSessionTemplate.selectList("ttestMapper.selectAbility", subjectCode);
		return (ArrayList<TTest>)list;
	}
	public String selectLastTTest() {
		return  sqlSessionTemplate.selectOne("ttestMapper.selectLastTTest");
	}
	public TTest selectTestCode(String testCode) {
		return sqlSessionTemplate.selectOne("ttestMapper.selectTestCode", testCode);
	}

	public int updateTestCount(TTest ttest) {
		return sqlSessionTemplate.update("ttestMapper.updateTestCount", ttest);
	}

	public ArrayList<TTest> selectOpenTest(String subjectCode) {
		List<TTest> list = sqlSessionTemplate.selectList("ttestMapper.selectOpenTest", subjectCode);
		return (ArrayList<TTest>)list;
	}

	public ArrayList<TTest> selectTtestView(Search search) {
		List<TTest> list = sqlSessionTemplate.selectList("ttestMapper.selectTtestView", search);
		return (ArrayList<TTest>)list;
	}

	public int selectTtestViewCount(String classCode) {
		return sqlSessionTemplate.selectOne("ttestMapper.selectTtestViewCount", classCode);
	}

	public ArrayList<TTest> testResultClassList(Search search) {
		List<TTest> list = sqlSessionTemplate.selectList("ttestMapper.testResultClassList", search);
		return (ArrayList<TTest>)list;
	}

}
