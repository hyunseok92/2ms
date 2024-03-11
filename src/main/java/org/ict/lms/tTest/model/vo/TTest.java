package org.ict.lms.tTest.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class TTest implements Serializable {
	private static final long serialVersionUID = -6505713619777353478L;

	private String testCode;
	private String testName;
	private String subjectCode;
	private String subjectName;
	private int testCount;
	private Date testStartDate;
	private Date testEndDate;
	private String testType;
	private String classCode;
	private String className;
	private String teacherCode;
	private String teacherName;
	private String abilityNum;
	private String ability;
	public TTest() {
		super();
	}
	public TTest(String testCode, String testName, String subjectCode, String subjectName, int testCount,
			Date testStartDate, Date testEndDate, String testType, String classCode, String className,
			String teacherCode, String teacherName, String abilityNum, String ability) {
		super();
		this.testCode = testCode;
		this.testName = testName;
		this.subjectCode = subjectCode;
		this.subjectName = subjectName;
		this.testCount = testCount;
		this.testStartDate = testStartDate;
		this.testEndDate = testEndDate;
		this.testType = testType;
		this.classCode = classCode;
		this.className = className;
		this.teacherCode = teacherCode;
		this.teacherName = teacherName;
		this.abilityNum = abilityNum;
		this.ability = ability;
	}
	public String getTestCode() {
		return testCode;
	}
	public void setTestCode(String testCode) {
		this.testCode = testCode;
	}
	public String getTestName() {
		return testName;
	}
	public void setTestName(String testName) {
		this.testName = testName;
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
	public int getTestCount() {
		return testCount;
	}
	public void setTestCount(int testCount) {
		this.testCount = testCount;
	}
	public Date getTestStartDate() {
		return testStartDate;
	}
	public void setTestStartDate(Date testStartDate) {
		this.testStartDate = testStartDate;
	}
	public Date getTestEndDate() {
		return testEndDate;
	}
	public void setTestEndDate(Date testEndDate) {
		this.testEndDate = testEndDate;
	}
	public String getTestType() {
		return testType;
	}
	public void setTestType(String testType) {
		this.testType = testType;
	}
	public String getClassCode() {
		return classCode;
	}
	public void setClassCode(String classCode) {
		this.classCode = classCode;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getTeacherCode() {
		return teacherCode;
	}
	public void setTeacherCode(String teacherCode) {
		this.teacherCode = teacherCode;
	}
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
	public String getAbilityNum() {
		return abilityNum;
	}
	public void setAbilityNum(String abilityNum) {
		this.abilityNum = abilityNum;
	}
	public String getAbility() {
		return ability;
	}
	public void setAbility(String ability) {
		this.ability = ability;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "TTest [testCode=" + testCode + ", testName=" + testName + ", subjectCode=" + subjectCode
				+ ", subjectName=" + subjectName + ", testCount=" + testCount + ", testStartDate=" + testStartDate
				+ ", testEndDate=" + testEndDate + ", testType=" + testType + ", classCode=" + classCode
				+ ", className=" + className + ", teacherCode=" + teacherCode + ", teacherName=" + teacherName
				+ ", abilityNum=" + abilityNum + ", ability=" + ability + "]";
	}
	
}
