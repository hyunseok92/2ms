package org.ict.lms.survey.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.ict.lms.common.Paging;
import org.ict.lms.common.Search;
import org.ict.lms.survey.model.vo.ChartSurvey;
import org.ict.lms.survey.model.vo.ResultSurvey;
import org.ict.lms.survey.model.vo.StartSurvey;
import org.ict.lms.survey.model.vo.Survey;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("surveyDao")
public class SurveyDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public ArrayList<Survey> selectSurveyList() {
		List<Survey> list = sqlSessionTemplate.selectList("surveyMapper.selectSurveyList1");
		return (ArrayList<Survey>)list;
	}
	
	public ArrayList<Survey> selectSurveyList(Paging paging) {
		List<Survey> list = sqlSessionTemplate.selectList("surveyMapper.selectSurveyList", paging);
		return (ArrayList<Survey>)list;
	}
	
	public ArrayList<Survey> selectSurvey(String surv_cate) {
		List<Survey> list = sqlSessionTemplate.selectList("surveyMapper.selectSurvCateSurveyList", surv_cate);
		return (ArrayList<Survey>)list;
	}
	
	public ArrayList<Survey> selectStudentSurveyList(Search search) {
		List<Survey> list = sqlSessionTemplate.selectList("surveyMapper.selectStudentSurveyList", search);
		return (ArrayList<Survey>)list;
	}
	
	public ArrayList<ResultSurvey> selectSurveyCate(String classcode) {
		List<ResultSurvey> list = sqlSessionTemplate.selectList("surveyMapper.selectResultSurveyCate", classcode);
		return (ArrayList<ResultSurvey>)list;
	}
	
	public ArrayList<ChartSurvey> selectFacilityChart(String survno) {
		List<ChartSurvey> list = sqlSessionTemplate.selectList("surveyMapper.selectFacilityResult", survno);
		return (ArrayList<ChartSurvey>)list;
	}
	
	public ArrayList<ChartSurvey> selectTeacherChart(String survno) {
		List<ChartSurvey> list = sqlSessionTemplate.selectList("surveyMapper.selectTeacherResult", survno);
		return (ArrayList<ChartSurvey>)list;
	}
	
	public ArrayList<ChartSurvey> selectEtcChart(String survno) {
		List<ChartSurvey> list = sqlSessionTemplate.selectList("surveyMapper.selectEtcResult", survno);
		return (ArrayList<ChartSurvey>)list;
	}
	
	public Survey selectSurvey(Survey survey) {
		return sqlSessionTemplate.selectOne("surveyMapper.selectSurvey", survey);
	}
	
	public int selectMaxNo() {
		return sqlSessionTemplate.selectOne("surveyMapper.selectMaxNo");
	}
	
	public int selectSurveyListCount() {
		return sqlSessionTemplate.selectOne("surveyMapper.selectSurveyListCount");
	}
	
	public int selectStudentSurveyListCount(String classcode) {
		return sqlSessionTemplate.selectOne("surveyMapper.selectStudentSurveyListCount", classcode);
	}
	
	public int insertSurvey(Survey survey) {
		return sqlSessionTemplate.insert("surveyMapper.insertSurvey", survey);
	}
	
	public int insertResultSurvey(ResultSurvey resultSurv) {
		return sqlSessionTemplate.insert("surveyMapper.insertResultSurvey", resultSurv);
	}
	
	public int insertSurvey(StartSurvey startSurv) {
		return sqlSessionTemplate.insert("surveyMapper.insertStartSurvey", startSurv);
	}
	
	public int updateSurvey(Survey survey) {
		return sqlSessionTemplate.update("surveyMapper.updateSurvey", survey);
	}
	
	public int updateStatus(ResultSurvey resultSurv) {
		return sqlSessionTemplate.update("surveyMapper.updateStatus", resultSurv);
	}
	
	public int deleteSurvey(String surv_cate) {
		return sqlSessionTemplate.delete("surveyMapper.deleteSurvey", surv_cate);
	}	

}
