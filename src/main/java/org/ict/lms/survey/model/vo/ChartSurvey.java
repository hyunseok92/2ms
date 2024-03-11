package org.ict.lms.survey.model.vo;

import java.io.Serializable;

public class ChartSurvey implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5899746776530492391L;

	private String survey1;
	private String survey2;
	private String survey3;
	private String survey4;
	private String survey5;
	private String answer1;
	private String answer2;
	private String answer3;
	private String answer4;
	private String answer5;
	
	public String getSurvey1() {
		return survey1;
	}
	public void setSurvey1(String survey1) {
		this.survey1 = survey1;
	}
	public String getSurvey2() {
		return survey2;
	}
	public void setSurvey2(String survey2) {
		this.survey2 = survey2;
	}
	public String getSurvey3() {
		return survey3;
	}
	public void setSurvey3(String survey3) {
		this.survey3 = survey3;
	}
	public String getSurvey4() {
		return survey4;
	}
	public void setSurvey4(String survey4) {
		this.survey4 = survey4;
	}
	public String getSurvey5() {
		return survey5;
	}
	public void setSurvey5(String survey5) {
		this.survey5 = survey5;
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	@Override
	public String toString() {
		return "ChartSurvey [survey1=" + survey1 + ", survey2=" + survey2 + ", survey3=" + survey3 + ", survey4="
				+ survey4 + ", survey5=" + survey5 + ", answer1=" + answer1 + ", answer2=" + answer2 + ", answer3="
				+ answer3 + ", answer4=" + answer4 + ", answer5=" + answer5 + "]";
	}
	
}
