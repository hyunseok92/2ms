package org.ict.lms.survey.model.vo;

import java.io.Serializable;

public class ResultSurvey implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5708702436062892460L;
	
	private String survey_no;
	private String survey_cate;
	private String survey_type;
	private String answer1;
	private String answer2;
	private String answer3;
	private String answer4;
	private String answer5;
	private String class_code;
	private String student_code;
	
	public String getSurvey_no() {
		return survey_no;
	}
	public void setSurvey_no(String survey_no) {
		this.survey_no = survey_no;
	}
	public String getSurvey_cate() {
		return survey_cate;
	}
	public void setSurvey_cate(String survey_cate) {
		this.survey_cate = survey_cate;
	}
	public String getSurvey_type() {
		return survey_type;
	}
	public void setSurvey_type(String survey_type) {
		this.survey_type = survey_type;
	}
	public String getAnswer1() {
		return answer1;
	}
	public void setAnswer1(String answer1) {
		this.answer1 = answer1;
	}
	public String getAnswer2() {
		return answer2;
	}
	public void setAnswer2(String answer2) {
		this.answer2 = answer2;
	}
	public String getAnswer3() {
		return answer3;
	}
	public void setAnswer3(String answer3) {
		this.answer3 = answer3;
	}
	public String getAnswer4() {
		return answer4;
	}
	public void setAnswer4(String answer4) {
		this.answer4 = answer4;
	}
	public String getAnswer5() {
		return answer5;
	}
	public void setAnswer5(String answer5) {
		this.answer5 = answer5;
	}
	public String getClass_code() {
		return class_code;
	}
	public void setClass_code(String class_code) {
		this.class_code = class_code;
	}
	public String getStudent_code() {
		return student_code;
	}
	public void setStudent_code(String student_code) {
		this.student_code = student_code;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	@Override
	public String toString() {
		return "ResultSurvey [survey_no=" + survey_no + ", survey_cate=" + survey_cate + ", survey_type=" + survey_type
				+ ", answer1=" + answer1 + ", answer2=" + answer2 + ", answer3=" + answer3 + ", answer4=" + answer4
				+ ", answer5=" + answer5 + ", class_code=" + class_code + ", student_code=" + student_code + "]";
	}
	
	
	
	
}
