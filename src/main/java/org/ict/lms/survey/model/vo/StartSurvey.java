package org.ict.lms.survey.model.vo;

import java.io.Serializable;

public class StartSurvey implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5684294491561412678L;

	private String survNo;
	private String student_code;
	private String class_code;
	private String status;
	
	public String getSurvNo() {
		return survNo;
	}
	public void setSurvNo(String survNo) {
		this.survNo = survNo;
	}
	public String getStudent_code() {
		return student_code;
	}
	public void setStudent_code(String student_code) {
		this.student_code = student_code;
	}
	public String getClass_code() {
		return class_code;
	}
	public void setClass_code(String class_code) {
		this.class_code = class_code;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	@Override
	public String toString() {
		return "StartSurvey [survNo=" + survNo + ", student_code=" + student_code + ", class_code=" + class_code
				+ ", status=" + status + "]";
	}	
}
