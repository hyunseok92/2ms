package org.ict.lms.subject.model.vo;

import java.io.Serializable;

public class Subject implements Serializable {

	private static final long serialVersionUID = 875460679876168125L;
	private String subjectCode;
	private String subjectName;
	private int basicTime;
	private String firstCategoryCode;
	private String firstCategoryName;
	private String secondCategoryCode;
	private String secondCategoryName;
	private String thirdCategoryCode;
	private String thirdCategoryName;
	private String fourthCategoryCode;
	private String fourthCategoryName;

	public Subject() {
		super();
	}

	public Subject(String subjectCode, String subjectName, int basicTime, String firstCategoryCode,
			String firstCategoryName, String secondCategoryCode, String secondCategoryName, String thirdCategoryCode,
			String thirdCategoryName, String fourthCategoryCode, String fourthCategoryName) {
		super();
		this.subjectCode = subjectCode;
		this.subjectName = subjectName;
		this.basicTime = basicTime;
		this.firstCategoryCode = firstCategoryCode;
		this.firstCategoryName = firstCategoryName;
		this.secondCategoryCode = secondCategoryCode;
		this.secondCategoryName = secondCategoryName;
		this.thirdCategoryCode = thirdCategoryCode;
		this.thirdCategoryName = thirdCategoryName;
		this.fourthCategoryCode = fourthCategoryCode;
		this.fourthCategoryName = fourthCategoryName;
	}

	@Override
	public String toString() {
		return "Subject [subjectCode=" + subjectCode + ", subjectName=" + subjectName + ", basicTime=" + basicTime
				+ ", firstCategoryCode=" + firstCategoryCode + ", firstCategoryName=" + firstCategoryName
				+ ", secondCategoryCode=" + secondCategoryCode + ", secondCategoryName=" + secondCategoryName
				+ ", thirdCategoryCode=" + thirdCategoryCode + ", thirdCategoryName=" + thirdCategoryName
				+ ", fourthCategoryCode=" + fourthCategoryCode + ", fourthCategoryName=" + fourthCategoryName + "]";
	}

	public String getSubjectCode() {
		return subjectCode;
	}

	public void setSubjectCode(String subjectCode) {
		this.subjectCode = subjectCode;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	public int getBasicTime() {
		return basicTime;
	}

	public void setBasicTime(int basicTime) {
		this.basicTime = basicTime;
	}

	public String getFirstCategoryCode() {
		return firstCategoryCode;
	}

	public void setFirstCategoryCode(String firstCategoryCode) {
		this.firstCategoryCode = firstCategoryCode;
	}

	public String getFirstCategoryName() {
		return firstCategoryName;
	}

	public void setFirstCategoryName(String firstCategoryName) {
		this.firstCategoryName = firstCategoryName;
	}

	public String getSecondCategoryCode() {
		return secondCategoryCode;
	}

	public void setSecondCategoryCode(String secondCategoryCode) {
		this.secondCategoryCode = secondCategoryCode;
	}

	public String getSecondCategoryName() {
		return secondCategoryName;
	}

	public void setSecondCategoryName(String secondCategoryName) {
		this.secondCategoryName = secondCategoryName;
	}

	public String getThirdCategoryCode() {
		return thirdCategoryCode;
	}

	public void setThirdCategoryCode(String thirdCategoryCode) {
		this.thirdCategoryCode = thirdCategoryCode;
	}

	public String getThirdCategoryName() {
		return thirdCategoryName;
	}

	public void setThirdCategoryName(String thirdCategoryName) {
		this.thirdCategoryName = thirdCategoryName;
	}

	public String getFourthCategoryCode() {
		return fourthCategoryCode;
	}

	public void setFourthCategoryCode(String fourthCategoryCode) {
		this.fourthCategoryCode = fourthCategoryCode;
	}

	public String getFourthCategoryName() {
		return fourthCategoryName;
	}

	public void setFourthCategoryName(String fourthCategoryName) {
		this.fourthCategoryName = fourthCategoryName;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
