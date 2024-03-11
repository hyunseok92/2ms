package org.ict.lms.survey.model.vo;

public class Survey implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4177058316056731713L;
	
	private int survey_no;
	private String survey_cate;
	private String survey_type;
	private String survey_date;
	private String survey1;
	private String survey2;
	private String survey3;
	private String survey4;
	private String survey5;
	
	public int getSurvey_no() {
		return survey_no;
	}
	public void setSurvey_no(int survey_no) {
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
	public String getSurvey_date() {
		return survey_date;
	}
	public void setSurvey_date(String survey_date) {
		this.survey_date = survey_date;
	}
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
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	@Override
	public String toString() {
		return "Survey [survey_no=" + survey_no + ", survey_cate=" + survey_cate + ", survey_type=" + survey_type
				+ ", survey_date=" + survey_date + ", survey1=" + survey1 + ", survey2=" + survey2 + ", survey3="
				+ survey3 + ", survey4=" + survey4 + ", survey5=" + survey5 + "]";
	}
	
}
