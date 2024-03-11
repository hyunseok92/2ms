package org.ict.lms.survey.model.service;

import java.util.ArrayList;

import org.ict.lms.common.Paging;
import org.ict.lms.common.Search;
import org.ict.lms.survey.model.vo.ChartSurvey;
import org.ict.lms.survey.model.vo.ResultSurvey;
import org.ict.lms.survey.model.vo.StartSurvey;
import org.ict.lms.survey.model.vo.Survey;

public interface SurveyService {

	public ArrayList<Survey> selectSurveyList();
	
	public ArrayList<Survey> selectSurveyList(Paging paging);
	
	public ArrayList<Survey> selectStudentSurveyList(Search search);
	
	public ArrayList<Survey> selectSurveyList(String surv_cate);
	
	public ArrayList<ResultSurvey> selectSurveyCate(String classcode);
	
	public ArrayList<ChartSurvey> selectFacilityChart(String survno);
	
	public ArrayList<ChartSurvey> selectTeacherChart(String survno);
	
	public ArrayList<ChartSurvey> selectEtcChart(String survno);
	
	public int selectSurveyListCount();
	
	public int selectStudentSurveyListCount(String classcode);
	
	public int selectMaxNo();
	
	public Survey selectSurvey(Survey survey);
	
	public int insertSurvey(Survey survey);
	
	public int insertStartSurvey(StartSurvey startSurv);
	
	public int insertResultSurvey(ResultSurvey resultSurv);
	
	public int updateSurvey(Survey survey);
	
	public int updateStatus(ResultSurvey rs);
	
	public int deleteSurvey(String surv_cate);

	
}
