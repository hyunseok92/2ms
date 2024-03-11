package org.ict.lms.survey.model.service;

import java.util.ArrayList;

import org.ict.lms.common.Paging;
import org.ict.lms.common.Search;
import org.ict.lms.survey.model.dao.SurveyDao;
import org.ict.lms.survey.model.vo.ChartSurvey;
import org.ict.lms.survey.model.vo.ResultSurvey;
import org.ict.lms.survey.model.vo.StartSurvey;
import org.ict.lms.survey.model.vo.Survey;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("surveyService")
public class SurveyServiceImpl implements SurveyService {

	@Autowired private SurveyDao surveyDao;

	@Override
	public ArrayList<Survey> selectSurveyList() {
		return surveyDao.selectSurveyList();
	}
	
	@Override
	public ArrayList<Survey> selectSurveyList(Paging paging) {
		return surveyDao.selectSurveyList(paging);
	}
	
	@Override
	public int selectMaxNo() {
		return surveyDao.selectMaxNo();
	}

	@Override
	public int insertSurvey(Survey survey) {
		return surveyDao.insertSurvey(survey);
	}

	@Override
	public int updateSurvey(Survey survey) {
		return surveyDao.updateSurvey(survey);
	}

	@Override
	public int deleteSurvey(String surv_cate) {
		return surveyDao.deleteSurvey(surv_cate);
	}

	@Override
	public Survey selectSurvey(Survey survey) {
		return surveyDao.selectSurvey(survey);
	}

	@Override
	public int selectSurveyListCount() {
		return surveyDao.selectSurveyListCount();
	}

	@Override
	public ArrayList<Survey> selectSurveyList(String surv_cate) {
		return surveyDao.selectSurvey(surv_cate);
	}

	@Override
	public int insertStartSurvey(StartSurvey startSurv) {
		return surveyDao.insertSurvey(startSurv);
	}
	

	@Override
	public int selectStudentSurveyListCount(String classcode) {
		return surveyDao.selectStudentSurveyListCount(classcode);
	}	 
	
	@Override
	public ArrayList<Survey> selectStudentSurveyList(Search search) {
		return surveyDao.selectStudentSurveyList(search);
	}

	@Override
	public int insertResultSurvey(ResultSurvey resultSurv) {
		return surveyDao.insertResultSurvey(resultSurv);
	}

	@Override
	public int updateStatus(ResultSurvey resultSurv) {
		return surveyDao.updateStatus(resultSurv);
	}

	@Override
	public ArrayList<ResultSurvey> selectSurveyCate(String classcode) {
		return surveyDao.selectSurveyCate(classcode);
	}

	@Override
	public ArrayList<ChartSurvey> selectFacilityChart(String survno) {
		return surveyDao.selectFacilityChart(survno);
	}
	
	@Override
	public ArrayList<ChartSurvey> selectTeacherChart(String survno) {
		return surveyDao.selectTeacherChart(survno);
	}

	@Override
	public ArrayList<ChartSurvey> selectEtcChart(String survno) {
		return surveyDao.selectEtcChart(survno);
	}	
}
